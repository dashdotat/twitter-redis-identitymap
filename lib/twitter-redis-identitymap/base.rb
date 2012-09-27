require 'redis'

module TwitterRedisIdentityMap
	class Base
		def initialize(options = nil)
			raise ArgumentError if !options.nil? && !options.is_a?(Hash)
			@options = options.nil? ? {} : options
			@options[:namespace] = "tri:cache:" unless @options[:namespace]
			@redis = @options[:redis].nil? ? Redis.new : Redis.new({:url => @options[:redis]})			
		end

		def fetch(id)
			raise ArgumentError if id.nil?
			id = Marshal.load(id)
			object = nil
			if @redis.exists("#{@options[:namespace]}#{id[:id]}")
				val = @redis.get("#{@options[:namespace]}#{id[:id]}")
				object = Marshal.load(val)
			end
			object			
		end

		def store(attrs, object)
			raise ArgumentError if (attrs.nil? || object.nil?)
			attrs = Marshal.load(attrs)
			@redis.set("#{@options[:namespace]}#{attrs[:id]}", Marshal.dump(object)) == "OK" ? object : nil
		end

		def redis
			@redis
		end
	end
end
