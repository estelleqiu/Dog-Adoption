ActiveAdmin.register Animal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :name, :animal_type, :birth_date, :gender, :variety, :character, :slug, :photo_url, :description
  form partial: 'form'
  config.clear_action_items!
  index do
    selectable_column
    column :id
    column :name
    column :animal_type
    column :birth_date
    column :gender
    column :variety
    column :character
    column :life_detail
    column(:photo_url) { |photo_link| image_tag("http://p4wgbyuaw.bkt.clouddn.com/test.jpg", class: 'dog-image') }
    actions
  end
end
