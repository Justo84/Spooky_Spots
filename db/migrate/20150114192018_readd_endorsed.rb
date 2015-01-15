class ReaddEndorsed < ActiveRecord::Migration
  def change
    add_column :locations, :endorsed, :boolean, :default => false

  end
end
