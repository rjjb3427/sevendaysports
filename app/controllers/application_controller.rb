class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # private
  # def team
  #   if has_team?
  #     @team = @university.teams.find(params[:id])
  #   else
  #     Team.find(params[:id])
  #   end
  # end

  # def university
  #   if has_university?
  #     @university.find(params[:id])
  #   else
  #     University.find(params[:id])
  #   end
  # end

  # def event
  #   if has_event?
  #     @event = @team.events.find(params[:id])
  #   else
  #     Event.find(params[:id])
  #   end
  # end

  # def teams
  #   if has_team?
  #     Team.order(:last_name)
  #   else
  #     'No team exists'
  #   end
  # end

  # def universities
  #   if has_university?
  #     University.order(:name)
  #   else
  #     'No university exists'
  #   end
  # end

  # def events
  #   if has_event?
  #     @team.events.order(event_on: :desc)
  #   else
  #     'No event exists'
  #   end
  # end

  # def has_team?
  #   @university.teams.present?
  # end

  # def has_university?
  #   @university.present?
  # end

  # def has_event?
  #   @teams.event.present?
  # end
end
