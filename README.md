twitter-redis-identitymap
=========================
[![Build Status](https://secure.travis-ci.org/kgfullerton/twitter-redis-identitymap.png?branch=master)][travis]
[travis]: http://travis-ci.org/kgfullerton/twitter-redis-identitymap

###	Redis IdentityMap store for sferik/twitter gem

## Installation
```sh
gem install twitter-redis-identitymap
```

## Usage

```ruby
Twitter.configure do |config|
  config.consumer_key = YOUR_CONSUMER_KEY
  config.consumer_secret = YOUR_CONSUMER_SECRET
  config.oauth_token = YOUR_OAUTH_TOKEN
  config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
	config.identity_map = TwitterRedisIdentityMap::Base
end
```

This will use the default Redis URL (redis://localhost:6379/0)

By default it uses a key namespace of tri:cache: followed by the id to store

## To Do

* Allow configuring Redis location and namespace
* Allow Redis TTL expiring of keys automatically

## Contributing
In the spirit of [free software][free-sw], **everyone** is encouraged to help
improve this project.

[free-sw]: http://www.fsf.org/licensing/essays/free-sw.html

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up inconsistent whitespace)
* by refactoring code
* by fixing [issues][]
* by reviewing patches

[issues]: https://github.com/kgfullerton/twitter-redis-identitymap/issues

## Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. When submitting a bug report, please include a [Gist][]
that includes a stack trace and any details that may be necessary to reproduce
the bug, including your gem version, Ruby version, and operating system.
Ideally, a bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## Submitting a Pull Request
1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add specs for your unimplemented feature or bug fix.
4. Run `bundle exec rake spec`. If your specs pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rake spec`. If your specs fail, return to step 5.
7. Run `open coverage/index.html`. If your changes are not completely covered by your tests, return to step 3.
8. Add, commit, and push your changes.
9. [Submit a pull request.][pr]

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/

## Supported Ruby Versions
This library aims to support and is [tested against][travis] the following Ruby
version:

* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.

If you would like this library to support another Ruby version, you may
volunteer to be a maintainer. Being a maintainer entails making sure all tests
run and pass on that implementation. When something breaks on your
implementation, you will be personally responsible for providing patches in a
timely fashion. If critical issues for a particular implementation exist at the
time of a major release, support for that Ruby version may be dropped.

## Copyright
Copyright (c) 2012 Kevin Fullerton.
See [LICENSE][] for details.
Thanks to the contributors and maintainers of the [Twitter gem][twittergem] who the tests were used from to ensure compatibility

[license]: https://github.com/kgfullerton/twitter-redis-identitymap/blob/master/LICENSE.md
[twittergem]: https://github.com/sferik/twitter
