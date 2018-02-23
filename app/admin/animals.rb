ActiveAdmin.register Animal do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :animal_type, :birth_date, :gender, :variety, :character, :life_detail, :photo_url
end
