class Location < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  has_many :location_images

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 20}
  validates :state, presence: true
  validates :town, presence: true
  validates :size, presence: true
  validates :history, presence: true
  validates :user_id, presence: true

end
