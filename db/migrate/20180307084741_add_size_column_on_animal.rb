class AddSizeColumnOnAnimal < ActiveRecord::Migration[5.1]
  def change
    add_column :animals, :size, :string
    remove_column :animals, :photo_url
  end
end
