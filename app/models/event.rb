class Event < ActiveRecord::Base
  attr_accessible :author, :away_team_score, :details, :event_on, 
                  :home_team_score, :name, :title, :type, :home_team_id,
                  :away_team_id, :user_id

  validates_presence_of :author, :name, :title, :event_on, :type

  has_many :articles, dependent: :destroy
  has_many :medias, dependent: :destroy
  has_many :scores, dependent: :destroy

  belongs_to :user
  belongs_to :team

  scope :by_user, ->(user_id) {where(user_id: user_id).order("name")}
  scope :by_team, ->(team_id) {where(team_id: team_id).order("sport_type")}
  scope :upcoming_events, -> {where("event_on >= ?", 1.minute.from_now)}
  scope :past_events, -> {where("event_on < ?", 1.minute.ago)}
  scope :recent_articles, -> {where("event_on > ?", 3.days.ago).limit(3)}
  scope :recent_scores, -> {where("event_on > ?", 3.days.ago).limit(3)}
end
