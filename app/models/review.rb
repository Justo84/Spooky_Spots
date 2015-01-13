class Review < ActiveRecord::Base
  belongs_to :location
  validates :location_id, presence: true
  validates :spo_rating, presence: true
  validates :sce_rating, presence: true
  validates :exp_rating, presence: true
  validates :description, presence: true, length: {minimum: 10}
end
