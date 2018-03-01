class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.integer :kind
      t.integer :type
      t.integer :quantity
      t.string :information_url
      t.string :benefactor

      t.timestamps
    end
  end
end
