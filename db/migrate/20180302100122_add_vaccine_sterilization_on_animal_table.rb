class AddVaccineSterilizationOnAnimalTable < ActiveRecord::Migration[5.1]
  def change
    add_column :animals, :is_vaccined, :boolean, default: false
    add_column :animals, :is_sterilizationed, :boolean, default: false
  end
end
