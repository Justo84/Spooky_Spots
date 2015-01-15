class DropEndorse < ActiveRecord::Migration
  def change
    remove_column :locations, :endorsed

  end
end
