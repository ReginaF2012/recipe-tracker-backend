class Api::V1::RecipesController < ApplicationController
    
    def show
        recipe = Recipe.find_by(id: params[:id])
        render json: RecipeSerializer.new(recipe).to_serialized_json
    end

    def index
        recipes = Recipe.all 
        render json: RecipeSerializer.new(recipes).to_serialized_json
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :instructions, :cook_time, :prep_time)
    end
end