class StaticPagesController < ApplicationController
  def home
    # @university = University.by_id
    # @university_teams = University.by_id(talladaega)
    @teams = Team.university_join
    @baseball_teams = Team.by_sport_type('baseball')
    @upcoming_events = Event.upcoming
    @recent_events = Event.recent
  end

  def contact
  end
end
