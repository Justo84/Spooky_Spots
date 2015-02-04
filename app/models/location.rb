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

  # def self.search(query)
  #   where("name like ?", "%#{query}%")
  # end

  def self.search(query)
    where("name like ?", "%#{query}%")
    where("name ilike :q or state ilike :q or town ilike :q", q: "%#{query}%")
  end


  # def self.search(search)
  #   if search
  #     where(:conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #
  #   end
  # end
  #
  # def self.search(search)
  #   if search
  #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #   else
  #     find(:all)
  #   end
  # end

  # def self.search(query)
  #   query = "%" + search + "%"
  #   find(:all, :conditions => ['title LIKE ? OR state LIKE ?', query])
  # end



end
