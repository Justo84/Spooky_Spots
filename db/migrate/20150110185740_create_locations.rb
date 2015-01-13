class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :state, null: false
      t.string :town, null: false
      t.string :street
      t.decimal :longitude
      t.decimal :latitude

      t.string :description, null: false
      t.timestamps null: false
    end
  end
end
