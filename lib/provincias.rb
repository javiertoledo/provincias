# -*- encoding: utf-8 -*-
require "provincias/version"

module Provincias

  def self.find(id)
    @@provincias.each do |p|
      return Provincia.new(p) if id == p[:id]
    end
    nil
  end

  def self.find_by_name(name)
    @@provincias.each do |p|
      return Provincia.new(p) if name == p[:name]
    end
    nil
  end

  def self.all
    @@provincias.map { |p| Provincia.new(p) }
  end

  def self.all_for_select
    @@provincias.map { |p| [p[:name], p[:id]] }
  end

  class Provincia

    attr_reader :id, :name

    def initialize(hash)
      @id = hash[:id]
      @name = hash[:name]
    end
  end

private
  @@provincias = [
    {:id => 1, :name => 'Álava'},
    {:id => 2, :name => 'Albacete'},
    {:id => 3, :name => 'Alicante'},
    {:id => 4, :name => 'Almería'},
    {:id => 5, :name => 'Avila'},
    {:id => 6, :name => 'Badajoz'},
    {:id => 7, :name => 'Illes Baleares'},
    {:id => 8, :name => 'Barcelona'},
    {:id => 9, :name => 'Burgos'},
    {:id => 10, :name => 'Cáceres'},
    {:id => 11, :name => 'Cádiz'},
    {:id => 12, :name => 'Cástellón'},
    {:id => 13, :name => 'Ciudad Real'},
    {:id => 14, :name => 'Córdoba'},
    {:id => 15, :name => 'Coruña, A'},
    {:id => 16, :name => 'Cuenca'},
    {:id => 17, :name => 'Girona'},
    {:id => 18, :name => 'Granada'},
    {:id => 19, :name => 'Guadalajara'},
    {:id => 20, :name => 'Guipuzcoa'},
    {:id => 21, :name => 'Huelva'},
    {:id => 22, :name => 'Huesca'},
    {:id => 23, :name => 'Jaén'},
    {:id => 24, :name => 'León'},
    {:id => 25, :name => 'Lleida'},
    {:id => 26, :name => 'Rioja, La'},
    {:id => 27, :name => 'Lugo'},
    {:id => 28, :name => 'Madrid'},
    {:id => 29, :name => 'Málaga'},
    {:id => 30, :name => 'Murcia'},
    {:id => 31, :name => 'Navarra'},
    {:id => 32, :name => 'Ourense'},
    {:id => 33, :name => 'Asturias'},
    {:id => 34, :name => 'Palencia'},
    {:id => 35, :name => 'Palmas, Las'},
    {:id => 36, :name => 'Pontevedra'},
    {:id => 37, :name => 'Salamanca'},
    {:id => 38, :name => 'Santa Cruz de Tenerife'},
    {:id => 39, :name => 'Cantabria'},
    {:id => 40, :name => 'Segovia'},
    {:id => 41, :name => 'Sevilla'},
    {:id => 42, :name => 'Soria'},
    {:id => 43, :name => 'Tarragona'},
    {:id => 44, :name => 'Teruel'},
    {:id => 45, :name => 'Toledo'},
    {:id => 46, :name => 'Valencia'},
    {:id => 47, :name => 'Valladolid'},
    {:id => 48, :name => 'Vizcaya'},
    {:id => 49, :name => 'Zamora'},
    {:id => 50, :name => 'Zaragoza'},
    {:id => 51, :name => 'Ceuta'},
    {:id => 52, :name => 'Melilla'}]
end