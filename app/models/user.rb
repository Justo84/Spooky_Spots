class User < ActiveRecord::Base
  has_many :locations
  has_many :reviews

  def is_admin?
    role == 'admin'
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
