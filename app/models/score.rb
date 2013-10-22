<<<<<<< HEAD
class Score < ActiveRecord::Base
=======
class Score < Event
>>>>>>> add-rspec-article-model
  attr_accessible :author, :away_team_score, :description, :event_id, :home_team_score

  validates_presence_of :author, :description, :home_team_score, :away_team_score

<<<<<<< HEAD
  scope :by_score, -> {where("created_at <= ?", Time.now)}}
=======
  scope :by_score, -> {where("created_at <= ?", Time.now).order("DESC")}}
>>>>>>> add-rspec-article-model
end
