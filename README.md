# OkuribitoRails

OkuribitoRails is an engine for Rails that aims to be the managing method call status.

![OkuribitoRails](https://raw.githubusercontent.com/muramurasan/okuribito_rails/master/doc/sample.png)

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

And put it in the path defined in `config / initializers / okuribito_rails.rb`.

(By Default `config/okuribito.yml`)

## Features

Here's a comprehensive list of the features currently in OkuribitoRails:

* Monitoring
  * During application execution, monitor specified method calls
    * After detecting the method call, register the call history in the DB
* Web UI
  * Viewing monitored methods
  * Viewing call history of monitored methods
