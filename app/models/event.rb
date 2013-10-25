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
      "Winner: #{home_team.name} Score: #{home_team_score}"
    elsif home_team_score == away_team_score
      "Tie: #{home_team.name} & #{away_team.name} Score: #{home_team_score}"
    else
      "Winner: #{away_team.name} Score: #{away_team_score}"
    end
  end
end
