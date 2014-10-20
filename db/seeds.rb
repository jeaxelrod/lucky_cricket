# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
original = Product.create(name: "Original Cricket Flout")
original.description = "100% Pure Cricket \n\n 100 grams(approx 10 servings)"
original.price = 20.00
original.save
red_pepper = Product.create(name: "Red Pepper & Cilantro Flour")
red_pepper.description = "100% Pure Cricket with that extra kick for those savory protein pastries \n\n 100 grams (approx 10 servings)"
red_pepper.price = 20.00
red_pepper.save
apple = Product.create(name: "Apple & Cinnamon Flour")
apple.description = "100% Pure Cricket with that added taste for your baked sweets \n\n 100 grams (approx 10 servings)"
apple.price = 20.00
apple.save
