class Location < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  has_many :location_images

  validates :name, presence: true
  validates :description, length: {
    minimum: 30,
    maximum: 400,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  validates :state, presence: true
  validates :town, presence: true
  validates :size, presence: true
  validates :history, presence: true
  validates :user_id, presence: true

  def self.search(query)
    where("name ilike :q or state ilike :q or town ilike :q", q: "%#{query}%")
  end

  paginates_per 10

end
