class AddUseridToImages < ActiveRecord::Migration
  def change
    add_column :location_images, :user_id, :integer, null: false
  end
end
