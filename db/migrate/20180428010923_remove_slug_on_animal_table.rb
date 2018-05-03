class RemoveSlugOnAnimalTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :animals, :slug
  end
end
