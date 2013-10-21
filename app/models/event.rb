class Event < ActiveRecord::Base
  attr_accessible :author, :away_team_id, :away_team_score, :details, :event_on, 
                  :home_team_id, :home_team_score, :name, :title, :user_id

  scope :by_user, ->(user_id) {where(user_id: user_id, name: name).order(name: :asc)}
  scope :by_team, ->(team_id) {where(team_id: team_id).order(sport_type: :asc)}
  scope :upcoming_events, -> {where(id: id, event_on: >= 1.minute.from.now)}
  scope :past_events, -> {where(id: id, event_on: <= 1.minute.ago)}
  scope :recent_articles, -> {where(id: id, created_at: < 3.days.ago.limit(3))}
  scope :recent_scores, -> {where(id: id, created)at: < 3.days.ago,limit(3)}
end
