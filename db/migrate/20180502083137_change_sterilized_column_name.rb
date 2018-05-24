class ChangeSterilizedColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :animals, :is_sterilizationed, :is_sterilized
  end
end
