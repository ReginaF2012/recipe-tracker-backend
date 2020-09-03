class RecipeSerializer
    
    def initialize(recipe_object)
        @recipe = recipe_object
    end

    def to_serialized_json
        options = {
            include: [
                ingredients: {only: [:name, :amount]}
            ],
            only: [:id, :name, :cook_time, :prep_time, :instructions]
        }

        @recipe.to_json(options)
        
    end
end
