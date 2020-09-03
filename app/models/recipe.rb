class Recipe < ApplicationRecord
    belongs_to :user
    has_many :recipes_ingredients
    has_many :ingredients, through: :recipes_ingredients
    validates :name, presence: :true
    # accepts_nested_attributes_for :ingredients

    # custom accepts nested attributes for, since the form will be for a recipe but have the ingredient and the amount(which is an attribute of the join table)

    # takes in an array of hashes/objects
    def ingredients_attributes=(ingredient_attributes)
       
      # iterate over the array
      ingredient_attributes.each do |ingredient_attribute|

        # ingredients only have a name so, this MUST be present
        if ingredient_attribute[:name].present?
          # byebug

          # either find an existing ingredient or create a new one
          ingredient = Ingredient.find_or_create_by(name: ingredient_attribute[:name])

          # then build an instance of the join table, adding in the amount 
          self.recipes_ingredients.build(ingredient: ingredient, amount: ingredient_attribute[:amount])
        end
      end
    end
end
