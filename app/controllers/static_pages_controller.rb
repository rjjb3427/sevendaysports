class StaticPagesController < ApplicationController
  def home
    @events = Event.upcoming
  end

  def contact
  end
end
