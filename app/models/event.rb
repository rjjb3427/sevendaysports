class Event < ActiveRecord::Base
  attr_accessible :author, :home_team_score, :away_team_score, :details, 
                  :event_on, :name, :title, :kind, :winner

  validates_presence_of :author, :name, :title, :kind

  has_many :articles, dependent: :destroy
  has_many :medias, as: :mediable

  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :user

  scope :by_user, ->(user_id) {where(user_id: user_id).order("name")}
  scope :by_team, ->(team_id) {where(team_id: team_id).order("sport_type")}
  scope :by_score, -> {select(:home_team_score, :away_team_score, :winner)}
  scope :upcoming, -> {where("event_on >= ?", 1.minute.from_now).order("event_on ASC")}
  scope :past, -> {where("event_on < ?", 1.minute.ago).order("event_on DESC")}
  scope :recent, -> {where("event_on > ?", 3.days.ago).order("event_on DESC").limit(3)}

  def winner
    if home_team_score > away_team_score
      home_team_name
    elsif home_team_score == away_team_score
      "#{home_team_name} #{away_team_name}"
    else
      away_team_name
    end
  end

  def home_team_name
    home_team.try(:name) || "No home team associated"
  end

  def away_team_name
    away_team.try(:name) || "No home team associated"
  end
end
