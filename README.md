# Scajax

This gem adds ajax functionality to generated scaffold.

## Installation

Add this line to your application's Gemfile:

    gem 'scajax', git: 'git@github.com:menuitem/scajax.git'

or

    gem 'scajax'

And then execute:

    $ bundle

Also you can  install it yourself in your system gems as:

    $ gem install scajax

## Usage

Example:

add scajax to your project Gemfile

    gem 'scajax', git: 'git@github.com:menuitem/scajax.git'

and run 'bundle' to install this gem in your project.

    $ bundle

Generate new scaffold called cats:

    $ rails g scaffold cats name color skills:text

Don't forget to run migration:

    $ rake db:migrate

Generate ajax for cats scaffold with scajax generator

    $ rails g scajax cats

Open your project in a browser.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
