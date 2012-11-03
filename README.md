# RakeCheck

Checking the Project for Code Smells and bad documentation

[![Build Status](https://secure.travis-ci.org/TBAA/rake_check.png)](http://travis-ci.org/TBAA/rake_check)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/TBAA/rake_check)

## Installation

Add this line to your application's Gemfile:

    gem 'rake_check'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake_check

## Usage

Put this in your Rakefile:

require 'rake_check'
load 'rake_check/tasks/check.rake'

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request