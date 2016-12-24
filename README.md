[![CircleCI](https://circleci.com/gh/muramurasan/okuribito_rails.svg?style=svg)](https://circleci.com/gh/muramurasan/okuribito_rails)
[![Code Climate](https://codeclimate.com/github/muramurasan/okuribito_rails.png)](https://codeclimate.com/github/muramurasan/okuribito_rails)
[![Test Coverage](https://codeclimate.com/github/muramurasan/okuribito_rails/badges/coverage.svg)](https://codeclimate.com/github/muramurasan/okuribito_rails/coverage)

# OkuribitoRails

https://rubygems.org/gems/okuribito_rails

![Sample](https://raw.githubusercontent.com/muramurasan/okuribito_rails/master/doc/sample.png)

OkuribitoRails is an engine for Rails that aims to manage method call status.

OkuribitoRails monitors method calls with YAML.

You can identify methods that have not been called from anywhere!

# Features

Here's a comprehensive list of the features currently in OkuribitoRails:

* Monitoring method call
  * During application execution, monitor specified method calls
    * After detecting the method call, register the call history in the DB
    * You can enable or disable monitoring of method calls (depending on RAILS_ENV)
* Web UI
  * Viewing monitored methods
  * Viewing call history of monitored methods
  * You can hide or show WebUI (depending on RAILS_ENV)

# Getting started

Please read [Getting Started](https://github.com/muramurasan/okuribito_rails/wiki/Getting-Started).

# More information

The following link have useful information on using OkuribitoRails.

https://github.com/muramurasan/okuribito_rails/wiki

# Caution!

OkuribitoRails does not support namespaces.

We already scheduled the feature, please wait.

# License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
