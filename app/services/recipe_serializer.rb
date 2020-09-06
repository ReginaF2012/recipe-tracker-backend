class RecipeSerializer
    
    def initialize(recipe_object)
        @recipe = recipe_object
    end

    def to_serialized_json
        options = {
            include: [
                ingredients: { include: [recipes_ingredients: {only: [:amount]}], only: [:name]}
            ],
            only: [:id, :name, :cook_time, :prep_time, :instructions, :summary, :image_url, :servings, :user_id]
        }

        @recipe.to_json(options)
        
    end
end
