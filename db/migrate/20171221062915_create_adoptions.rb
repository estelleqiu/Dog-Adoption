class CreateAdoptions < ActiveRecord::Migration[5.1]
  def change
    create_table :adoptions do |t|
      t.belongs_to :animal, index: true
      t.belongs_to :person, index: true
      t.datetime :time

      t.timestamps
    end
  end
end
