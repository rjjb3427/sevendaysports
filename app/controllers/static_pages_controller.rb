class StaticPagesController < ApplicationController
  def home
    @universities = University.all
    @baseball_teams = Team.baseball
    @upcoming_events = Event.upcoming
    @recent_events = Event.recent
  end

  def contact
  end
end
