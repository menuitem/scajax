# Scajax [![Build Status](https://travis-ci.org/menuitem/scajax.png?branch=master)](https://travis-ci.org/menuitem/scajax) [![Gem Version](https://badge.fury.io/rb/scajax.png)](http://badge.fury.io/rb/scajax)

This gem quickly adds a basic ajax functionality to generated scaffold in rails.

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

### Quick Simple Example:

1. Add scajax to your application's Gemfile:

    gem 'scajax'

2. Run 'bundle' to install this gem in your project.

    $ bundle

3. Generate new scaffold called e.g. posts:

    $ rails generate scaffold post title body:text published:boolean

4. Don't forget to run migration:

    $ rake db:migrate

5. Generate ajax for posts scaffold with scajax generator

    $ rails g scajax post

Open your project in a browser.

### Quick Example with twitter-bootstrap:

1. Add to your application's Gemfile:

    gem 'scajax'
    gem 'twitter-bootstrap-rails'

2. Run 'bundle' to install gems in your project.

    $ bundle

3. Install twitter-bootstrap:

    $ rails generate bootstrap:install static

4. Generate new scaffold called e.g. posts:

    $ rails generate scaffold post title body:text published:boolean --no-stylesheets

5. Don't forget to run migration:

    $ rake db:migrate

6. Generate boootstrap themed for posts

    $ rails g bootstrap:themed posts

7. Generate ajax for posts scaffold with scajax generator

    $ rails g scajax post

Open your project in a browser.

(8) If you have somehow file 'scaffolds.css.scss' and you don't use it just delete it:

    $ rm app/assets/stylesheets/scaffolds.css.scss

Refresh your browser (F5).

### Quick Example with zurb-foundation:

1. Add to your application's Gemfile:

    gem 'scajax'
    gem 'zurb-foundation'

2. And run 'bundle' to install gems in your project.

    $ bundle

3. Install zurb-foundation:

    $ rails g foundation:install

4. Generate new scaffold called e.g. posts:

    $ rails generate scaffold post title body:text published:boolean --no-styelsheets

5. Don't forget to run migration:

    $ rake db:migrate

6. Generate ajax for posts scaffold with scajax generator

    $ rails g scajax post


Open your project in a browser.


(7) If you have somehow file 'scaffolds.css.scss' and you don't use it just delete it:

    $ rm app/assets/stylesheets/scaffolds.css.scss

Refresh your browser (F5). 


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
