class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.integer  :activity_type, default: 0
      t.string   :title
      t.datetime :start_time
      t.datetime :end_time
      t.string    :place
      t.string    :content, default: ''

      t.timestamps
    end
  end
end
