class Media < ActiveRecord::Base
  attr_accessible :author, :details, :event_id, :team_id, :title, :type, :url, :user_id

  scope :by_user, ->(user_id) {where(user_id: user_id).order(full_name: full_name)}
  scope :by_team, ->(team_id) {where(team_id: team_id).order(name: name)}
  scope :by_event, ->(event_id) {where(event_id: event_id).order(event_on: event_on)}
  scope :by_media, -> {where(id: id).order(created_at: :created_at)}

  validates_presence_of :author, :details, :title, :type, :url
end
