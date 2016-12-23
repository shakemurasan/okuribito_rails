[![CircleCI](https://circleci.com/gh/muramurasan/okuribito_rails.svg?style=svg)](https://circleci.com/gh/muramurasan/okuribito_rails)
[![Code Climate](https://codeclimate.com/github/muramurasan/okuribito_rails.png)](https://codeclimate.com/github/muramurasan/okuribito_rails)
[![Test Coverage](https://codeclimate.com/github/muramurasan/okuribito_rails/badges/coverage.svg)](https://codeclimate.com/github/muramurasan/okuribito_rails/coverage)

# OkuribitoRails

OkuribitoRails is an engine for Rails that aims to manage method call status.

OkuribitoRails monitors method calls with YAML.

You can identify methods that have not been called from anywhere!

![Sample](https://raw.githubusercontent.com/muramurasan/okuribito_rails/master/doc/sample.png)

# Features

Here's a comprehensive list of the features currently in OkuribitoRails:

* Monitoring
  * During application execution, monitor specified method calls
    * After detecting the method call, register the call history in the DB
* Web UI
  * Viewing monitored methods
  * Viewing call history of monitored methods

# Installation

Installing OkuribitoRails is easy.

## Specify Gem dependencies

```ruby
gem 'okuribito_rails'
```

## Run the installer

Run the installer.

```shell
rails g okuribito_rails:install
```

The installer makes the following settings.

- Create migration files (Used by OkuribitoRails)
- Updating routing (Mount engine)
- Create default configuration

## Run db:migrate

```shell
rake db:migrate
```

## Definition of monitoring method

Create a file that defines the method to be monitored.

```ruby
User:
  - '#feed'
  - '#profile'
Micropost:
  - '.from_users_followed_by'
```

And put it in the path defined in `config/initializers/okuribito_rails.rb`.

(By Default `config/okuribito.yml`)
