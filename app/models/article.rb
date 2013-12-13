class Article < ActiveRecord::Base
  attr_protected :author, :body, :title,  :event_id

  validates_presence_of :body

  belongs_to :event

  scope :recent, -> {where("created_at < ?", 3.days.ago).limit(3)}
end
