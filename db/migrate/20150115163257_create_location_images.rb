class CreateLocationImages < ActiveRecord::Migration
  def change
    create_table :location_images do |t|
      t.string :image, null: false
      t.string :description
      t.integer :location_id, null: false

      t.timestamps null: false
    end
  end
end
