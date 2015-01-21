class AddLocationsDesc < ActiveRecord::Migration
  def change
    add_column :locations, :description, :text, null: false
  end
end
