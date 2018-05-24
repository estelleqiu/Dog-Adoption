class RemoveDefaultOnUrl < ActiveRecord::Migration[5.1]
  def change
    remove_column :media, :url
    add_column :media, :url, :string
  end
end
