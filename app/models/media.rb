class Media < ActiveRecord::Base
  attr_accessible :author, :details, :title, :url, :mediable_type, :mediable_id

  validates_presence_of :author, :details, :title, :mediable_type, :url

  belongs_to :mediable, polymorphic: true

  scope :by_user, ->(user_id) { where(user_id: user_id).order(full_name: full_name) }
  scope :by_team, ->(team_id) { where(team_id: team_id).order(name: name) }
  scope :by_event, ->(event_id) { where(event_id: event_id).order(event_on: :event_on) }
  scope :by_media, -> { where(id: id).order(created_at: :created_at) }
  scope :recent, -> { where(id: id).order(created_at: :created_at).limit(3) }
end
