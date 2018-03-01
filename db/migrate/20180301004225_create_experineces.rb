class CreateExperineces < ActiveRecord::Migration[5.1]
  def change
    create_table :experineces do |t|
      t.string :title
      t.text :body
      t.string :original_url

      t.timestamps
    end
  end
end
