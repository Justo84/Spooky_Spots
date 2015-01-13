class AddUserIds < ActiveRecord::Migration
  def change
    add_column :locations, :user_id, :integer, null: false
    add_column :reviews, :user_id, :integer, null: false
  end
end
