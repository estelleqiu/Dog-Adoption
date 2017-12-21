class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string   :name, null: false
      t.integer  :type, default: 0
      t.integer  :year
      t.integer  :gender
      t.string   :variety
      t.string   :character
      t.string   :life_detail
      t.string   :photo
      t.timestamps
    end
  end
end
