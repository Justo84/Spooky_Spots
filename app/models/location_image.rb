class LocationImage < ActiveRecord::Base
  belongs_to :location
  belongs_to :user

  mount_uploader :image, LocationImageUploader

  validates :image, presence: true
  validates :location_id, presence: true
end
