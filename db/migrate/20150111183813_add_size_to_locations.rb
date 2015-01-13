class AddSizeToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :size, :integer, null: false
    add_column :locations, :history, :text, null: false
  end
end
