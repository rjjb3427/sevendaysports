class Team < ActiveRecord::Base
  attr_accessible :name, :sport_type, :university_id
  
  has_many :home_events, foreign_key: :home_team_id, class_name: 'Event'
  has_many :away_events, foreign_key: :away_team_id, class_name: 'Event'
  has_many :medias, as: :mediable
  belongs_to :university
  
  validates_presence_of :name, :sport_type

  # scope :by_university, ->(university_id) { where(team_id: team_id).order(name: name) }
  # scope :find_team, -> { Team.find_by id: id }
  # scope :by_sport_type, ->(sport_type) { Team.where(sport_type: sport_type) }
  # scope :with_university, joins: :teams 

  def self.by_university
    University.where(university_id: university_id).first
  end

  def self.university_join
    University.joins(:teams)
  end

  def self.by_sport_type(sport_type)
    where(sport_type: sport_type)
  end

  def self.baseball
    by_sport_type('Baseball/Softball')
  end

  def university_name
    university.name
  end
end
