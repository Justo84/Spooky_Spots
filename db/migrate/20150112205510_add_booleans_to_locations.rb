class AddBooleansToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :private_land, :boolean
    add_column :locations, :in_use, :boolean
  end
end
