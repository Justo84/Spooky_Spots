class ChangeSizeToString < ActiveRecord::Migration
  def change
    change_column :locations, :size, :string

  end
end
