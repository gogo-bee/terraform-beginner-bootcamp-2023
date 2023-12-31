# Terraform Beginner Bootcamp 2023 - Week 2


## Working With Ruby

### Bundler

Bundler is a package manager for ruby. (the way you bring packages into ruby)
It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file. eg

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command 

This will install the gems on the system globally (unlike nodejs which installs packages in place in a folder called node_modules)

A Gemfile.lock (Gem lock file) will be created to lockdown the gem versions being used in this project.

#### Executing Ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra ruby

Web application / Web framework for building up web apps

A micro web-framework for ruby to build web apps 

Its great for mock or developments servers or for very simple projects.

You can create a web-server in a single file.

[Sinatra](https://sinatrarb.com/)


## Terratowns Mock Server

### Running the Web Server

We can run the web server by executing the following commands 

```rb
 bundle install
      bundle exec ruby server.rb 
```

All of the code for our web server is stored in the `server.rb` file