class Recipe < ApplicationRecord
    belongs_to :user
    has_many :ingredients
    validates :name, presence: :true
    accepts_nested_attributes_for :ingredients

    def ingredients_attributes=(ingredient_attributes)
       
      ingredient_attributes.each do |ingredient_attribute|
       
        if ingredient_attribute[:name].present? && ingredient_attribute[:amount].present?
            ingredient = Ingredient.find_or_create_by(ingredient_attribute)
            self.ingredients << ingredient
        end
      end
    end
end
