class EventsController < ApplicationController
  before_filter :get_home_team, :get_away_team

  def index
    @events = @team.events
  end

  def new
    @event = @team.home_events.build
  end

  def create
    @event = @team.home_events.build(params[:event])
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to team_event_path(@team, @event)
    else
      render :new, flash[:error] = 'There was an error with your form'
    end
  end

  def show
    @home_team_event = @team.home_events.find_by_id(params[:id]) 
    @away_team_event = @team.away_events.find_by_id(params[:id])
  end

  def edit
  end

  def update
    if home_or_way_team_attributes_update
      flash[:success] = 'Media updated!'
    else
      render :edit, flash[:error] = 'Unable to update media'
    end
  end

  def destroy
    @event.delete
    flash[:notice] = 'You sure?'
    redirect_to team_events_path
  end

  private
  def home_or_away_attributes_update
    @home_team.update_attributes(params[:event]) || 
    @away_team.update_attributes(params[:event])
  end

  def get_home_team
    if has_home_team_events?
      @home_team = @home_team.events.find(params[:team_id])
    else
      'No home team present'
      # Event.find(params[:id])
    end
  end

  def get_away_team
    if has_away_team_events?
      @away_team = @away_team.events.find(params[:id])
    else
      Event.find(params[:id])
    end
  end

  def has_home_team_events?
    @home_team.events.present?
  end

  def has_away_team_events?
    @away_team.events.present?
  end
end
