class Score < Event
  attr_accessible :author, :home_team_score, :away_team_score, :description, 
                  :event_id

  validates_presence_of :author, :description, :home_team_score, :away_team_score

  belongs_to :event

  scope :by_score, -> {where("created_at <= ?", Time.now).order("DESC")}
end
