class StaticPagesController < ApplicationController
  def home
    @universities = University.all
    @baseball_teams = Team.baseball
    @upcoming_events = Event.upcoming
    @recent_events = Event.recent
    @recent_articles = Article.recent
  end

  def contact
  end
end
