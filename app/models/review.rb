class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  validates :location_id, presence: true
  validates :spo_rating, presence: true
  validates :sce_rating, presence: true
  validates :exp_rating, presence: true
  validates :description, length: {
    minimum: 10,
    maximum: 50,
    tokenizer: lambda { |str| str.split(/\s+/) },
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  validates :user_id, presence: true
end
