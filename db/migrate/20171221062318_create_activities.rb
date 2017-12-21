class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer  :type, default: 0
      t.string   :title
      t.datetime :time
      t.string    :place
      t.string    :content, default: ''

      t.timestamps
    end
  end
end
