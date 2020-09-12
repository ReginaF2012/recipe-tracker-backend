class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized, only: [:show, :index]
    
    def show
        recipe = Recipe.find_by(id: params[:id])
        render json: RecipeSerializer.new(recipe).to_serialized_json
    end

    def index
        recipes = Recipe.all 
        render json: RecipeSerializer.new(recipes).to_serialized_json
    end


    def create
        if recipe = Recipe.create(recipe_params)
            update_image(recipe)
            render json: RecipeSerializer.new(recipe).to_serialized_json
        else
            render json: {errors: recipe.errors.full_messages} 
        end
    end

    def destroy
        Recipe.find_by(id: params[:id]).destroy
    end

    def update
        recipe = Recipe.find_by(id: params[:id])
        recipe.update(recipe_params)

        update_image(recipe)
        if recipe.errors.any?
            render json: {errors: recipe.errors.full_messages}
        else
            render json: RecipeSerializer.new(recipe).to_serialized_json
        end
    end

    private

    def update_image(recipe)
        if params[:image] != ""
            image = Cloudinary::Uploader.upload(params[:image])
            recipe.update(image_url: image["url"])
        end
    end

    def recipe_params
        params.require(:recipe).permit(:name, :servings, :summary, :user_id, :instructions, :cook_time, :prep_time, ingredients_attributes: [:name, :amount])
    end
end