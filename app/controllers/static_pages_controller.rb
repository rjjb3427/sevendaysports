class StaticPagesController < ApplicationController
  def home
    # @university = University.by_id
    # @university_teams = University.by_id(talladaega)
    # @teams = Team.university_join
    
    @universities = University.all
    @baseball_teams = Team.baseball
    @upcoming_events = Event.upcoming
    @recent_events = Event.recent
  end

  def contact
  end

  private
  def get_university

  end
  
  def get_home_team
    #@home_team = Team.find(params[:home_team_id])
  end
end
