# Provincias

Stop storing spanish provinces in a static table in your database. Use this gem with its class Provincia and reclaim a few bytes of your storage quota.

## Thanks

Province names and codes were gently stolen from 'provincias_espana_rails' gem, a database-based solution for the same problem: https://github.com/diacode/provincias_espana_rails

## Installation

Add this line to your application's Gemfile:

    gem 'provincias'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install provincias

## Usage

Install the gem as described before and use Province class to find and show province names.

You may want to include the Provincias module in your classes to access the Provicia class directly. In other case it will be namespaced under Provincias::Provincia.

The interface is simmilar to ActiveRecord's and provides provinces numeric codes you can use to search or easily link provinces to your classes.

    Provincia.find(id) => "Some Province Name"
    Provincia.find_by_name('Madrid') => Provincia(:id => 35, :name => 'Palmas, Las')
    Provincia.find_by_name('wombat') => nil
    Provincia.all => [...] # An array of Provincia instances
    Provincia.all_for_select => [...] # An array in form [name, id] to use in select helpers in Rails

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request