class EventsController < ApplicationController
  def index
    @events = Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
    @recent_events = Event.recent
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to event_path( @event)
    else
      render :new #, flash[:error] = 'There was an error processing your form'
    end
  end

  def show
    get_event
  end

  def edit
    get_event
  end

  def update
    get_event
    if home_or_way_team_attributes_update
      flash[:success] = 'Event updated!'
    else
      render :edit, flash[:error] = 'There was an error updating your form'
    end
  end

  def destroy
    get_event
    @event.delete
    flash[:notice] = 'You sure?'
    redirect_to team_events_path
  end

  private
  def get_event
    @event = Event.find_by_id(params[:id])
  end

  def home_or_away_attributes_update
    @home_team.update_attributes(params[:event]) || 
    @away_team.update_attributes(params[:event])
    @home_team.user_id = current_user_id
  end
end
