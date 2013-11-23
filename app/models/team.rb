class Team < ActiveRecord::Base
  attr_accessible :name, :sport_type, :university_id
  
  has_many :home_events, foreign_key: :home_team_id, class_name: "Event"
  has_many :away_events, foreign_key: :away_team_id, class_name: "Event"
  has_many :medias, as: :mediable
  belongs_to :university
  
  validates_presence_of :name, :sport_type

  def events
    home_events + away_events
  end
end
