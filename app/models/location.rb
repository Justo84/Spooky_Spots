class Location < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  has_many :location_images

  validates :name, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: {
    minimum: 20,
    maximum: 300,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  validates :state, presence: true
  validates :town, presence: true, length: { maximum: 30 }
  validates :size, presence: true
  validates :history, presence: true
  validates :user_id, presence: true

  def self.search(query)
    where("name ilike :q or state ilike :q or town ilike :q", q: "%#{query}%")
  end

  paginates_per 10

end
