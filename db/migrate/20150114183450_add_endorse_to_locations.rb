class AddEndorseToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :endorsed, :string, :default => "false"

  end
end
