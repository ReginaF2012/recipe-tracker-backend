# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.destroy_all
Ingredient.destroy_all
User.destroy_all

test_user = User.create(username: "Test", email: "test@fake.com", password: "Password1!", password_confirmation: "Password1!")

test_recipe = Recipe.create(prep_time: "10 minutes", cook_time: "8 minutes", servings: 36, user: test_user, name: "THE BEST CHOCOLATE CHIP COOKIE RECIPE EVER", summary: "This is the best chocolate chip cookie recipe ever! No funny ingredients, no chilling time, etc. Just a simple, straightforward, amazingly delicious, doughy yet still fully cooked, chocolate chip cookie that turns out perfectly every single time!", ingredients_attributes: [{name: "salted butter", amount: "1 cup"}, {name: "white sugar", amount: "1 cup"}, {name: "brown sugar", amount: "1 cup"}, {name: "pure vanilla extract", amount: "2 tsp"}, {name: "large eggs", amount: "2"}, {name: "all-purpose flour", amount: "3 cups"}, {name: "baking soda", amount: "1 tsp"}, {name: "baking powder", amount: "1/2 tsp"}, {name: "sea salt", amount: "1 tsp"}, {name: "chocolate chips", amount: "2 cups"}], instructions: "Preheat oven to 375 degrees F. Line a baking pan with parchment paper and set aside.
In a separate bowl mix flour, baking soda, salt, baking powder. Set aside.
Cream together butter and sugars until combined.
Beat in eggs and vanilla until fluffy.
Mix in the dry ingredients until combined.
Add 12 oz package of chocolate chips and mix well.
Roll 2-3 TBS (depending on how large you like your cookies) of dough at a time into balls and place them evenly spaced on your prepared cookie sheets. (alternately, use a small cookie scoop to make your cookies).
Bake in preheated oven for approximately 8-10 minutes. Take them out when they are just BARELY starting to turn brown.
Let them sit on the baking pan for 2 minutes before removing to cooling rack.")
