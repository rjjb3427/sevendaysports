class Team < ActiveRecord::Base
  attr_accessible :name, :sport_type, :university_id

  has_one :home_team, dependent: :destroy
  has_one :away_team, dependent: :destroy

  belongs_to :university
  
  validates_presence_of :name, :sport_type
end
