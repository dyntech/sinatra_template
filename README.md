# Sinatra template

This is a template directory for building quickly structured Sinatra applications.

## Environment

The `app_example.yml` should be copied to `app.yml` and the appropriate changes made.

    $ cp config/app_example.yml config/app.yml

## Installation
   
* Ruby 2.4.0
* MySQL 5.7.17 (need to install for client libs)
* MySQL C Connector (if you do not want to install MySQL)

### Install Bundler

        $ gem install bundler -v 1.14.3
    
### Using Homebrew MySQL Install 

Point bundler to the MySQL configuration tool
 
        $ brew install mysql
        $ bundle config build.mysql2 --with-mysql-config=/usr/local/Cellar/mysql/5.7.17/bin/mysql_config
        
### Using Homebrew MySQL C-Connector

        $ brew install mysql-connector-c
        $ bundle config build.mysql2 --with-mysql-rpath=/usr/local/lib
 
## Configuration

Application configuration file `app.yml` defaults to using the `development` environment unless the environment variable `RACK_ENV` is set to a different environment.

## Running

### Rack Up

    $ rackup -s thin -p 4567 -o 0.0.0.0
     
Running with reload:

    $ rerun -- rackup -s thin -p 4567 -o 0.0.0.0

Running reload watching for file changes:

    $ rerun --pattern '**/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md,feature}' --notify osx -- rackup -s thin -p 4567 -o 0.0.0.0
    

### Thin SSL

    $ thin -p 4567 \
     --ssl \
     --ssl-key-file ~/project/config/self_signed.key \
     --ssl-cert-file ~/project/config/self_signed.crt \
     --rackup config.ru \
     start

Running reload watching for file changes:
 
    $ rerun --pattern '**/*.{rb,js,coffee,css,scss,sass,erb,html,haml,ru,yml,slim,md,feature}' --notify osx -- thin -p 4567 --ssl --ssl-key-file /Users/rbirch/Development/gizmo/gizmo_openemr/config/self_signed.key --ssl-cert-file /Users/rbirch/Development/gizmo/gizmo_openemr/config/self_signed.crt --rackup config.ru start