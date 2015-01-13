class Location < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 10}
  validates :state, presence: true
  validates :town, presence: true
  validates :size, presence: true
  validates :history, presence: true, length: {minimum: 10}
  validates :user_id, presence: true

end
