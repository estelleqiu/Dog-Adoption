class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.string :url, default: 'http://p4wgbyuaw.bkt.clouddn.com/default_avatar.jpg'
      t.integer :medium_type
      t.references :mediable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
