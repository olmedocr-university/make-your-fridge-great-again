# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.delete_all
categories = Category.create([{title: 'Salads'},
                              {title: 'Hot dogs'},
                              {title: 'Luncheon meat'},
                              {title: 'Bacon & Sausage'},
                              {title: 'Hamburger & Other Ground Meats'},
                              {title: 'Fresh Beef, Veal, Lamb & Pork'},
                              {title: 'Fresh Poultry'},
                              {title: 'Soups & Stews'},
                              {title: 'Leftovers'}])

Food.delete_all
categories.each_index do |index|
  case index
  when 0
    Food.create(title: 'Egg, chicken, ham, tuna & macaroni salads', storage_time: 4, category: categories[index])
  when 1
    Food.create([{title: 'opened package', storage_time: 7, category: categories[index]},
                 {title: 'unopened package', storage_time: 14, category: categories[index]}])
  when 2
    Food.create([{title: 'opened package or deli sliced', storage_time: 4, category: categories[index]},
                 {title: 'unopened package', storage_time: 14, category: categories[index]}])
  when 3
    Food.create([{title: 'Bacon', storage_time: 7, category: categories[index]},
                 {title: 'Sausage, raw — from chicken, turkey, pork, beef', storage_time: 2, category: categories[index]}])
  when 4
    Food.create(title: 'Hamburger, ground beef, turkey, veal, pork, lamb, & mixtures of them', storage_time: 2, category: categories[index])

  when 5
    Food.create([{title: 'Steaks', storage_time: 4, category: categories[index]},
                 {title: 'Chops', storage_time: 4, category: categories[index]},
                 {title: 'Roasts', storage_time: 4, category: categories[index]}])
  when 6
    Food.create([{title: 'Chicken or turkey, whole', storage_time: 2, category: categories[index]},
                 {title: 'Chicken or turkey, pieces', storage_time: 2, category: categories[index]}])

  when 7
    Food.create(title: 'Vegetable or meat added', storage_time: 4, category: categories[index])
  when 8
    Food.create([{title: 'Cooked meat or poultry', storage_time: 4, category: categories[index]},
                 {title: 'Chicken nuggets or patties', storage_time: 4, category: categories[index]},
                 {title: 'Pizza', storage_time: 4, category: categories[index]}])
  else
    puts 'Error while seeding the database'
  end
end
















