class Team < ActiveRecord::Base
  attr_accessible :name, :sport_type, :university_id
  
  has_many :home_events, foreign_key: :home_team_id, class_name: "Event"
  has_many :away_events, foreign_key: :away_team_id, class_name: "Event"
  has_many :medias, as: :mediable
  belongs_to :university
  
  validates_presence_of :name, :sport_type

  # scope :by_university, ->(university_id) { where(team_id: team_id).order(name: name) }
  # scope :find_team, -> { Team.find_by id: id }
  # scope :by_sport_type, ->(sport_type) { Team.where(sport_type: sport_type) }
  # scope :with_university, joins: :teams 
  # def self.by_university(university_id)
  #   University.where(id: 1)
  #   University.joins(:teams).where(teams: { name: name })
  # end

  def self.by_university
    # University.teams.order(name: name)
    University.where(name: name)
  end

  def self.university_join
    University.joins(:teams)
  end

  def self.by_sport_type(sport_type)
    Team.where(sport_type: sport_type)
  end

  def events
    home_events + away_events
  end
end
