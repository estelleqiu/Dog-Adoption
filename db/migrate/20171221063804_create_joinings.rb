class CreateJoinings < ActiveRecord::Migration[5.1]
  def change
    create_table :joinings do |t|
      t.belongs_to :activity, index: true
      t.belongs_to :person

      t.timestamps
    end
  end
end
