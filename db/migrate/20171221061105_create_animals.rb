class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string   :name, null: false
      t.integer  :animal_type, default: 0
      t.date     :birth_date
      t.integer  :gender
      t.string   :variety
      t.string   :character
      t.string   :life_detail
      t.string   :photo_url
      t.timestamps
    end
  end
end
