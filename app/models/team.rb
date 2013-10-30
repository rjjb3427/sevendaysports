class Team < ActiveRecord::Base
  attr_accessible :name, :sport_type, :university_id

  has_many :event_teams
  has_many :events, through: :event_teams
  has_many :medias, dependent: :destroy
  belongs_to :university
  
  validates_presence_of :name, :sport_type
end
