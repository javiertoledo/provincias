# -*- encoding: utf-8 -*-
require "provincias"
require "test/unit"

class TestApi < Test::Unit::TestCase

  def test_provincias
    assert_not_nil Provincias
    assert_not_nil Provincias.find(28)
    assert_nil Provincias.find(100000)
    assert_equal Provincias.find(28).id, 28
    assert_equal Provincias.find(28).name, "Madrid"
    assert_equal Provincias.find_by_name('Palmas, Las').id, 35
    assert_equal Provincias.find_by_name('Palmas, Las').name, 'Palmas, Las'
    assert_nil Provincias.find_by_name('wombat')
    assert_instance_of Array, Provincias.all
    assert_instance_of Provincias::Provincia, Provincias.all.first
    assert_instance_of Array, Provincias.all_for_select
    assert_instance_of Array, Provincias.all_for_select.first
    assert_instance_of String, Provincias.all_for_select.first[0]
    assert_instance_of Fixnum, Provincias.all_for_select.first[1]
  end

  def test_ciudades
    assert_not_nil Provincias::Ciudades
    assert_nil Provincias::Ciudades.find(99999999)
    assert_not_nil Provincias::Ciudades.find(35017)
    assert_equal Provincias::Ciudades.find(35017).id, 35017
    assert_equal Provincias::Ciudades.find(35017).name, 'Puerto del Rosario'
    assert_nil Provincias::Ciudades.find_by_name('wombat')
    assert_instance_of Provincias::Ciudades::Ciudad, Provincias::Ciudades.find_by_name('Palmas de Gran Canaria, Las')
    assert_equal Provincias::Ciudades.find_by_name('Palmas de Gran Canaria, Las').id, 35016
    assert_equal Provincias::Ciudades.find_by_name('Palmas de Gran Canaria, Las').name, 'Palmas de Gran Canaria, Las'
    assert_instance_of Array, Provincias.find(28).ciudades
    assert_instance_of Provincias::Ciudades::Ciudad, Provincias.find(28).ciudades.first
    assert Provincias.find(28).ciudades.map { |c| c.name }.include?("Madrid")
    assert !Provincias.find(35).ciudades.map { |c| c.name }.include?("Madrid")
    assert_nil Provincias.find(28).find_ciudad(999999999)
    assert_instance_of Provincias::Ciudades::Ciudad, Provincias.find(28).find_ciudad(28001)
    assert_equal "Acebeda, La", Provincias.find(28).find_ciudad(28001).name
    assert_equal 28001, Provincias.find(28).find_ciudad(28001).id
    assert_instance_of Provincias::Ciudades::Ciudad, Provincias.find(28).find_ciudad_by_name("Alcobendas")
    assert_nil Provincias.find(28).find_ciudad_by_name("wombat")
    assert_equal "Alcobendas", Provincias.find(28).find_ciudad_by_name("Alcobendas").name
    assert_equal 28006, Provincias.find(28).find_ciudad_by_name("Alcobendas").id
    assert_instance_of Array, Provincias::Ciudades.all_for_select
    assert_instance_of Array, Provincias::Ciudades.all_for_select.first
    assert_instance_of String, Provincias::Ciudades.all_for_select.first[0]
    assert_instance_of Fixnum, Provincias::Ciudades.all_for_select.first[1]
    assert_instance_of Array, Provincias.find(35).ciudades_for_select
    assert_instance_of Array, Provincias.find(35).ciudades_for_select.first
    assert_instance_of String, Provincias.find(35).ciudades_for_select.first[0]
    assert_instance_of Fixnum, Provincias.find(35).ciudades_for_select.first[1]
    assert_same Provincias.find(35), Provincias.find(35).ciudades.first.provincia
    assert_instance_of Provincias::Provincia, Provincias::Ciudades.all.first.provincia
    assert_instance_of Provincias::Provincia, Provincias::Ciudades.find_by_name('Palmas de Gran Canaria, Las').provincia
    assert_equal 35, Provincias::Ciudades.find_by_name('Palmas de Gran Canaria, Las').provincia.id
    assert_equal 'Palmas, Las', Provincias::Ciudades.find_by_name('Palmas de Gran Canaria, Las').provincia.name
  end

end