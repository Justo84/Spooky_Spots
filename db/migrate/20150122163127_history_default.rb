class HistoryDefault < ActiveRecord::Migration
  def up
    change_column :locations, :history, :text, null: false, default: "Unknown"
  end

  def down
    change_column :locations, :history, :text, default: nil, null: false
  end
end
