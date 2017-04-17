# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

boat_classes = BoatClass.create(
  [ {class_name: 'KPro', registration_fee: 15},
    {class_name: '125cc Hydro', registration_fee: 50},
    {class_name: '125cc Runabout', registration_fee: 50},
    {class_name: '175cc Hydro', registration_fee: 50},
    {class_name: '250cc Hydro', registration_fee: 50},
    {class_name: '250cc Runabout', registration_fee: 50},
    {class_name: '350cc Hydro', registration_fee: 50},
    {class_name: '350cc Runabout', registration_fee: 50},
    {class_name: '500cc Hydro', registration_fee: 50},
    {class_name: '500cc Runabout', registration_fee: 50},
    {class_name: '700cc Hydro', registration_fee: 50},
    {class_name: '700cc Runabout', registration_fee: 50},
    {class_name: '1100cc Hydro', registration_fee: 50},
    {class_name: '1100cc Runabout', registration_fee: 50},
    {class_name: 'C-Racing Hydro', registration_fee: 50},
    {class_name: 'C-Racing Runabout', registration_fee: 50},
    {class_name: 'C-Service Hydro', registration_fee: 50},
    {class_name: 'C-Service Runabout', registration_fee: 50},
    {class_name: 'OSY', registration_fee: 50}
  ])
