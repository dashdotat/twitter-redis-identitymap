require File.expand_path('../lib/twitter-redis-identitymap/version',__FILE__)

Gem::Specification.new do |spec|
	spec.add_dependency 'redis'

	spec.add_development_dependency 'rake'
	spec.add_development_dependency 'rspec'
	spec.add_development_dependency 'simplecov'
	spec.add_development_dependency 'twitter', '~> 4.0.0'

	spec.authors = ["Kevin Fullerton"]
	spec.description = %q{A redis IdentityMap store for the twitter gem}
	spec.email = ["github@kenwa-solutions.co.uk"]
	spec.files = %w{CHANGELOG.md LICENSE.md README.md Rakefile twitter-redis-identitymap.gemspec}
	spec.files += Dir.glob("lib/**/*.rb")
	spec.files += Dir.glob("spec/**/*")
	spec.homepage = "http://github.com/kgfullerton/twitter-redis-identitymap"
	spec.name = "twitter-redis-identitymap"
	spec.require_paths = ["lib"]
	spec.required_rubygems_version = Gem::Requirement.new(">= 1.3.6")
	spec.summary = spec.description
	spec.test_files = Dir.glob("spec/**/*")
	spec.version = TwitterRedisIdentityMap::Version
end
