class Article < Event
  attr_accessible :body, :event_id

  validates_presence_of :body

  scope :by_article, -> {where("created_at <= ?", Time.now).order("DESC")}
end
