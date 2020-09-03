class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.belongs_to :user
      t.string :name
      t.string :cook_time
      t.string :prep_time
      t.text :instructions

      t.timestamps
    end
  end
end
