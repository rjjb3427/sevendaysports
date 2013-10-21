  class University < ActiveRecord::Base
  attr_accessible :address, :city, :name, :state, :url, :zip

  scope :univeersities, -> {University.order(name: "ASC")}

  validates :zip, presence: true, format: {with: /\A\d{5}(-\d+)?\z/}, length: {minimum: 5}
  validates_presence_of :name, :address, :city, :state, :url

end
