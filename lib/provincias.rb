# -*- encoding: utf-8 -*-
require "provincias/version"
require 'csv'

module Provincias

  def self.find(id)
    @@provincias[id]
  end

  def self.find_by_name(name)
    @@provincias.values.select { |p| p.name == name }.first
  end

  def self.all
    @@provincias.values
  end

  def self.all_for_select
    @@provincias.values.sort { |a,b| a.name <=> b.name }.map { |p| [p.name, p.id] }
  end

  class Provincia
    attr_reader :id, :name
    def initialize(row)
      id, @name = row
      @id = id.to_i
    end

    def ciudades
      Ciudades.find_by_provincia(@id)
    end

    def ciudades_for_select
      ciudades.sort { |a,b| a.name <=> b.name }.map { |c| [c.name, c.id] }
    end

    def find_ciudad(id)
      ciudades.select { |c| c.id == id }.first
    end

    def find_ciudad_by_name(name)
      ciudades.select { |c| c.name == name }.first
    end
  end

  def self.load_data
    @@provincias = {}
    CSV.foreach(File.expand_path('../../data/provinces.csv', __FILE__), :col_sep => ';', :encoding => 'utf-8') do |row|
        @@provincias[row[0].to_i] = Provincia.new(row)
    end
    Ciudades.load_data(@@provincias)
  end

  module Ciudades

    def self.find(id)
      @@ciudades[id]
    end

    def self.find_by_name(name)
      @@ciudades.values.select { |c| c.name == name }.first
    end

    def self.find_by_provincia(provincia_id)
      @@ciudades.values.select { |c| c.provincia_id == provincia_id }
    end

    def self.all
      @@ciudades.values
    end

    def self.all_for_select
      @@ciudades.values.sort { |a,b| a.name <=> b.name }.map { |c| [c.name, c.id] }
    end

    class Ciudad
      attr_reader :provincia_id, :id, :dc, :name
      def initialize(row)
        provincia_id, number, @dc, @name = row
        @provincia_id = provincia_id.to_i
        @id = (provincia_id+number).to_i
      end

      def provincia
        Provincias.find(@provincia_id)
      end
    end

    def self.load_data(provincias)
      @@ciudades = {}
      CSV.foreach(File.expand_path('../../data/cities.csv', __FILE__), :col_sep => ';', :encoding => 'utf-8') do |row|
        ciudad = Ciudades::Ciudad.new(row)
        @@ciudades[(row[0]+row[1]).to_i] = ciudad
      end
    end

  end

end
Provincias.load_data