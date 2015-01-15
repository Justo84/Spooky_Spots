class LocationImage < ActiveRecord::Base
  belongs_to :location

  mount_uploader :image, LocationImageUploader

  validates :image, presence: true
  validates :location_id, presence: true
end
