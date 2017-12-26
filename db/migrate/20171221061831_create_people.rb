class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.integer  :person_type
      t.string   :name
      t.integer  :gender
      t.string   :phone
      t.string   :story
      t.string   :password

      t.timestamps
    end
  end
end
