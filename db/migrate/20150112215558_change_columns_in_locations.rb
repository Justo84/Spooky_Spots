class ChangeColumnsInLocations < ActiveRecord::Migration
  def change
    change_column :locations, :private_land, :string
    change_column :locations, :in_use, :string
  end
end
