class Event < ActiveRecord::Base
  attr_accessible :author, :home_team_score, :away_team_score, :details, 
                  :event_on, :home_team_id, :away_team_id, :title, 
                  :kind, :winner

  validates_presence_of :author, :home_team_name, :away_team_name, :title, :kind, 
                        :event_on

  has_many :articles, dependent: :destroy
  has_many :medias, as: :mediable

  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  belongs_to :user

  scope :by_user, ->(user_id) {where(user_id: user_id).order("name")}
  scope :by_home_team, ->(home_team_id) { where(home_team_id: home_team_id) }
  scope :by_away_team, ->(away_team_id) { where(away_team_id: away_team_id) }
  scope :by_score, -> { select(:home_team_score, :away_team_score, :winner) }
  scope :upcoming, -> { where('event_on >= ?', 1.minute.from_now) }
  scope :past, -> { where('event_on < ?', 1.minute.ago)}
  scope :recent, -> { where('event_on > ?', 3.days.ago) }
  scope :order_desc, -> { order('event_on DESC').limit(3) }
  scope :order_asc, -> { order('event_on ASC') }

  def winner
    if   home_team_score > away_team_score
      home_team_name
    elsif home_team_score == away_team_score
      "#{home_team_name} #{away_team_name}"
    elsif home_team_score < away_team_score
      away_team_name
    else
      'Results not recorded'
    end
  end

  def home_team_name
    home_team.try(:name) || "No home team associated"
  end

  def away_team_name
    away_team.try(:name) || "No away team associated"
  end
end
