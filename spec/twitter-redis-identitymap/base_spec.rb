require 'helper'

describe TwitterRedisIdentityMap::Base do
	context "base class" do
		before(:each) do
			@map = TwitterRedisIdentityMap::Base.new
		end

		it "should respond_to fetch" do
			@map.respond_to?(:fetch).should be_true
		end

		it "should respond_to store" do
			@map.respond_to?(:store).should be_true
		end

		it "should respond_to redis" do
			@map.respond_to?(:redis).should be_true
		end
	end

	context "base initializer" do
		it "should return a default redis instance with no parameters" do
			@map = TwitterRedisIdentityMap::Base.new
			@map.redis.should be_a(Redis)
			@map.redis.client.location.should eq("127.0.0.1:6379")
			@map.redis.client.db.should eq(0)
		end
		it "should allow connecting to a different redis instance" do
			options = {:redis => "redis://127.0.0.1:6379/1" }
			@map = TwitterRedisIdentityMap::Base.new(options)
			@map.redis.client.location.should eq("127.0.0.1:6379")
			@map.redis.client.db.should eq(1)
		end
	end

	context "integration with Twitter::Base" do
		before do
			Twitter.identity_map = TwitterRedisIdentityMap::Base
			Twitter::Base.identity_map.redis.flushdb
			object = Twitter::Base.new(:id => 3)
			@base = Twitter::Base.store(object)
		end

		after do
			Twitter::Base.identity_map.redis.flushdb
			Twitter.identity_map = nil
		end

		describe ".identity_map" do
			it "returns an instance of the identity map" do
				Twitter::Base.identity_map.should be_a TwitterRedisIdentityMap::Base
			end
		end

		describe ".store" do
			it "stores Twitter::Base objects" do
				object = Twitter::Base.new(:id => 1)
				Twitter::Base.identity_map.redis.exists("tri:cache:1").should eq(false)
				Twitter::Base.store(object).should be_a(Twitter::Base)
				Twitter::Base.identity_map.redis.exists("tri:cache:1").should eq(true)
			end
		end

		describe ".fetch" do
			it "returns existing objects" do
				Twitter::Base.fetch(:id => 3).should be
			end
			it "raises an error on objects that don't exist" do
				expect { Twitter::Base.fetch(:id => 999) }.to raise_error(Twitter::Error::IdentityMapKeyError)
			end
		end

		describe ".fetch_or_new" do
			it "returns existing objects" do
				Twitter::Base.fetch(:id => 3).should be
			end
			it "creates new objects and stores them" do
				expect { Twitter::Base.fetch(:id => 7) }.to raise_error(Twitter::Error::IdentityMapKeyError)
				Twitter::Base.fetch_or_new(:id => 7).should be
				Twitter::Base.fetch(:id => 7).should be
			end
		end

		describe "#[]" do
			it "calls methods using [] with symbol" do
				@base[:object_id].should be_an Integer
			end
			it "calls methods using [] with string" do
				@base['object_id'].should be_an Integer
			end
			it "returns nil for missing methods" do
				@base[:foo].should be_nil
				@base['foo'].should be_nil
			end
		end

		describe "#to_hash" do
			it "returns a hash" do
				@base.to_hash.should be_a Hash
				@base.to_hash[:id].should eq(3)
			end
		end
	end
end
