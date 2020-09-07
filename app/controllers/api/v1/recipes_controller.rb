class Api::V1::RecipesController < ApplicationController
    
    def show
        recipe = Recipe.find_by(id: params[:id])
        render json: RecipeSerializer.new(recipe).to_serialized_json
    end

    def index
        recipes = Recipe.all 
        render json: RecipeSerializer.new(recipes).to_serialized_json
    end

    def create
        recipe = Recipe.new(recipe_params)
        if recipe.valid?
            recipe.save
            render json: RecipeSerializer.new(recipe).to_serialized_json
        else
            render json: {errors: recipe.errors.full_messages} 
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :servings, :summary, :user_id, :ingredients_attributes, :instructions, :cook_time, :prep_time)
    end
end