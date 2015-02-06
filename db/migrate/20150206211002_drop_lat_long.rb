class DropLatLong < ActiveRecord::Migration
  def up
    change_column :locations, :longitude, :string, default: "0"
    change_column :locations, :latitude, :string, default: "0"
  end

  def down
    change_column :locations, :longitude, :decimal
    change_column :locations, :latitude, :decimal
  end
end
