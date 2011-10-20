assert-spork
------------

Enables you to run your [assert](https://github.com/teaminsight/assert) tests with [spork](https://github.com/timcharper/spork).

This gem is an adaptation of [spork-testunit](https://github.com/timcharper/spork-testunit) to work with the assert testing framework.

Installation
------------

```
gem install spork-assert
```


Usage
-----

Run `spork` in one console.

```
spork assert
```

In another console, use `sporktest` to run your tests. You can use assert's
rake test task names to run only a subset of your tests.

```
sporktest # run all tests
sporktest test:unit # run only unit tests
sporktest test:functional:your_controller # run a single test
```

**Note:** There is no need to use `bundle exec` when running the `sporktest`
command. It is completely unnecessary and adds additional wait time before
your tests are run.

Configuring rails applications to work with spork-assert
--------------------------------------------------------

Add spork-assert to your Gemfile.

```
gem 'spork-assert', :require => false
```

Set up spork and assert in your `test/test_helper.rb` file.

```
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] = "test"
  require File.expand_path('../../config/environment', __FILE__)
  require 'assert'
  require 'assert-rails/test_help'
end
```

You will probably also need some [Spork.trap_method Jujitsu](https://github.com/timcharper/spork/wiki/Spork.trap_method-Jujutsu)
