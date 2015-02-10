class User < ActiveRecord::Base
  has_many :locations
  has_many :reviews
  has_many :location_images

  def is_admin?
    role == 'admin'
  end

  def forem_name
    username
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
