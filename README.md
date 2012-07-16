# Provincias

Deja de desperdiciar espacio de tu base de datos con tablas estáticas para guardar nombres de provincias y ciudades que no cambian prácticamente nunca.

Esta gema contiene los datos de provincias y ciudades provistos por el INE (http://www.ine.es) para el año 2012. Los datos se mantienen en formato CSV para facilitar posibles actualizaciones.

## Instalación

Añade esta línea al Gemfile de tu aplicación:

    gem 'provincias'

Y ejecuta:

    $ bundle

O instálala ejecutando el siguiente comando:

    $ gem install provincias

## Usage

La interfaz es similar a la de ActiveRecord, salvando las distancias. La gema provee con códigos numéricos de provincias y ciudades que puedes usar para enlazarlas con tus modelos.

Gestión de provincias:

    Provincias.find(28) => #<Provincia: @id=28, @name="Madrid">
    Provincias.find_by_name('Palmas, Las') => #<Provincia: @id=35, @name="Palmas, Las">
    Provincias.find_by_name('wombat') => nil
    Provincias.all => [...] # Un array de provincias
    Provincias.all_for_select => [...] # Un array de la forma [name, id] para usarlo en los helpers de tipo select en Rails

Gestión de ciudades de forma absoluta:

    Provincias::Ciudades.find(35017) => #<Ciudad: @id=35017, @name="Puerto del Rosario" ...>
    Provincias::Ciudades.find_by_name("Puerto del Rosario") => #<Ciudad: @id=35017, @name="Puerto del Rosario" ...>
    Provincias::Ciudades.all => [...] # Un array de ciudades
    Provincias::Ciudades.all_for_select => [...] # Un array de la forma [name, id] para usarlo en los helpers de tipo select en Rails
    Provincias::Ciudades.find_by_name("Puerto del Rosario").provincia => #<Provincia: @id=35, @name="Palmas, Las">

Gestión de ciudades de forma relativa a una provincia (Esta es la parte que no se parece a ActiveRecord):

    Provincias.find(28).ciudades => [...] # Un array con las ciudades de la provincia de Madrid
    Provincias.find(28).ciudades_for_select => [...] # Un array con las ciudades de la provincia de Madrid de la forma [name, id] para usarlo en los helpers de tipo select en Rails
    Provincias.find(28).find_ciudad(28006) => #<Ciudad: @id=28006, @name="Alcobendas" ...>
    Provincias.find(28).find_ciudad_by_name("Alcobendas") => #<Ciudad: @id=28006, @name="Alcobendas" ...>

Todas las búsquedas retornan nil si no encuentran coincidencias con lo que estás buscando.
