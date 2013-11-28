class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name,
                  :last_name, :school_name, :address, :city, :state, :zip, :dob

  has_many :events, dependent: :destroy
  has_many :medias, as: :mediable
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates_presence_of :first_name, :last_name, :password, :password_confirmation, 
                        :school_name, :dob

  def full_name
    "#{first_name} #{last_name}"
  end
end
