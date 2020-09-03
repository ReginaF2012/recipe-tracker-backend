class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :amount
      t.belongs_to :recipe

      t.timestamps
    end
  end
end
