class Score < ActiveRecord::Base
  attr_accessible :author, :away_team_score, :description, :event_id, :home_team_score

  validates_presence_of :author, :description, :home_team_score, :away_team_score

  scope :by_score, -> {where("created_at <= ?", Time.now)}}
end
