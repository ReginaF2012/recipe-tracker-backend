class CreateRecipesIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes_ingredients do |t|
      t.string :amount
      t.belongs_to :recipe, null: false, foreign_key: true
      t.belongs_to :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
