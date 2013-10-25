# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Food.create!(:barcode =>'00001', :company_name => '統洋', :product_name => '有機發芽黑豆漿', :capacity => 450, :capacity_unit => 'ml')
