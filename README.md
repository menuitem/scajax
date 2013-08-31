# Scajax [![Build Status](https://travis-ci.org/menuitem/scajax.png?branch=master)](https://travis-ci.org/menuitem/scajax) 

This gem adds basic ajax functionality to generated scaffold in rails.

## Installation

Add this line to your application's Gemfile:

    gem 'scajax'

or for latest version of the gem add:

    gem 'scajax', git: 'git@github.com:menuitem/scajax.git'

And then execute:

    $ bundle

Also you can  install it yourself in your system gems as:

    $ gem install scajax

## Usage

	$ rails g scajax [RESOURCE_NAME]

Example:

add scajax to your application's Gemfile:

    gem 'scajax'

or for latest version of the gem add:

	gem 'scajax', git: 'git@github.com:menuitem/scajax.git'	

and run 'bundle' to install this gem in your project.

    $ bundle

Generate new scaffold called e.g posts:

    $ rails generate scaffold post title body:text published:boolean

Don't forget to run migration:

    $ rake db:migrate

Generate ajax for posts scaffold with scajax generator

    $ rails g scajax post

Open your project in a browser.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
