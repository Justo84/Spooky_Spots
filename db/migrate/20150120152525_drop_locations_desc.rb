class DropLocationsDesc < ActiveRecord::Migration
  def change
    remove_column :locations, :description
  end
end
