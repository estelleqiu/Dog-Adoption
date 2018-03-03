class AddDescriptionColumnOnAnimal < ActiveRecord::Migration[5.1]
  def change
    remove_column :animals, :life_detail
    add_column :animals, :description, :text
  end
end
