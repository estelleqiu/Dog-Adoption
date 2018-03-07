class UpdateAnimalPhotoUrl < ActiveRecord::Migration[5.1]
  def change
    change_column :animals, :photo_url, :string, :default => 'http://p4wgbyuaw.bkt.clouddn.com/default_avatar.jpg'
  end
end
