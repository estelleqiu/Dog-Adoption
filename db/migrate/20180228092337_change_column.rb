class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :story
    add_column :adoptions, :story, :string
    add_column :animals, :slug, :string
  end
end
