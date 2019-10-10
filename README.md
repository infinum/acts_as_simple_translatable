# ActsAsSimpleTranslatable

[![Gem Version](https://badge.fury.io/rb/acts_as_simple_translatable.svg)](http://badge.fury.io/rb/acts_as_simple_translatable)

Adds translation table, and helpers to work with model translations.

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_simple_translatable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_simple_translatable

## Configuration

This will create a translations table:

    $ rails generate acts_as_simple_translatable:install

To add translation to your model just add to your model:

    acts_as_simple_translatable_on :name, :description

Add to `application.rb`:

    I18n.avaliable_locales = ['en', 'de']

## Usage

```ruby
m = Model.create(name: 'name', descritpion: 'description' )
m.translations.create(locale: 'de', tanslatable_field: 'name', content: 'name_in_de')

I18n.locale = 'de'
m.name                    #=> 'name_in_de'
m.description             #=> 'description'
```

Default locale content will be saved in original field in table (e.g. in table `Model`, attribute `name`) while for other locales content will be saved in `translations` table.

You also have the access to list of translatable fields:
```ruby
Model.locale_fields       #=> [:name, :description]
```

You can access to original field by prepending `_original` to attribute name:

```ruby
description_original
```

Also, when you accessing to attribute and there is no translation for it, you can define custom message or default will be returned.

```ruby
my_model.name     # => 'name' <-- default message

my_model.name('You need translate this')    # => 'You need translate this' <-- custom message
```

## Contributing

1. Fork it ( http://github.com/infinum/acts_as_simple_translatable/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
