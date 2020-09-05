class AddImageAndSummaryCollumnsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :summary, :text
    add_column :recipes, :image_url, :string, default: "https://www.publicdomainpictures.net/pictures/60000/velka/colorful-cutlery-logo-clipart.jpg"
  end
end
