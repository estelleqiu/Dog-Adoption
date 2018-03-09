class CreateFeeReports < ActiveRecord::Migration[5.1]
  def change
    create_table :fee_reports do |t|
      t.string :item_name
      t.integer :item_kind
      t.integer :fee_type
      t.integer :quantity
      t.string :information_url
      t.string :director

      t.timestamps
    end
  end
end
