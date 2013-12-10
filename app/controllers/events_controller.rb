class EventsController < ApplicationController
  before_filter :get_teams, only: [:new, :create, :edit]
  before_filter :get_event, except: [:index, :new, :create]

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to event_path(@event), success: 'Event created!'
    else
      render :new, error: 'There was an error processing your form'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to event_path(@event), success: 'Event updated!'
    else
      render :edit, error: 'There was an error updating your form'
    end
  end

  def destroy
    @event.delete
    redirect_to events_path
  end

  private
  def get_event
    @event = Event.find_by_id(params[:id])
  end

  def get_teams
    @teams = Team.all
  end
end
