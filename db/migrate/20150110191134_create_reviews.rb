class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description, null: false
      t.integer :spo_rating, null: false
      t.integer :sce_rating, null: false
      t.integer :exp_rating, null: false

      t.integer :location_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end
