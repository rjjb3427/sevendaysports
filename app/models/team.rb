class Team < ActiveRecord::Base
  attr_accessible :name, :sport_type, :university_id

  # has_many :contests
  has_many :events, dependent: :destroy#, through: :contests
  belongs_to :university
  
  validates_presence_of :name, :sport_type
end
