class Team < ActiveRecord::Base
  attr_accessible :name, :sport_type, :university_id

  validates_presence_of :name, :sport_type
end