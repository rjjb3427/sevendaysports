  class University < ActiveRecord::Base
  attr_accessible :address, :city, :name, :state, :url, :zip

  has_many :teams, dependent: :destroy

  validates :zip, presence: true, format: { with: /\A\d{5}(-\d+)?\z/ },
            length: { minimum: 5 }
  validates_presence_of :name, :address, :city, :state, :url

  scope :universities, -> { University.order(name: 'ASC') }
  # scope :team_by_university, ->(team_id) { where(team_id: team_id).order(name: name)}
end
