class Event < ActiveRecord::Base
  attr_accessible :author, :away_team_score, :details, :event_on, 
                  :home_team_score, :name, :title, :type, :home_team_id,
                  :away_team_id, :winner, :user_id

  validates_presence_of :author, :name, :title, :event_on, :type

  has_many :articles, dependent: :destroy
  has_many :medias, dependent: :destroy

  belongs_to :user
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"

  scope :by_user, ->(user_id) {where(user_id: user_id).order("name")}
  scope :by_team, ->(team_id) {where(team_id: team_id).order("sport_type")}
  scope :by_score, -> {select(:home_team_score, :away_team_score, :winner)}
  scope :upcoming_events, -> {where("event_on >= ?", 1.minute.from_now)}
  scope :past_events, -> {where("event_on < ?", 1.minute.ago)}
  scope :recent, -> {where("event_on > ?", 3.days.ago).limit(3)}

  def winner
    if home_team_score > away_team_score
      home_team_name
    elsif home_team_score == away_team_score
      "#{home_team_name} #{away_team_name}"
    else
      away_team_name
    end
  end

  private
  def home_team_name
    if home_team.present?
      home_team.name
    else
      'No team present'
    end
  end

  def away_team_name
    if away_team.present?
      away_team.name
    else
      'No team present'
    end
  end
end
