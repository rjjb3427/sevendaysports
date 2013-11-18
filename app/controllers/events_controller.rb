class EventsController < ApplicationController
  before_filter :load_team
  def index
    @events = @team.events
  end

  def new
    @event = @team.home_events.build
  end

  def create
    @event = @team.home_events.build(params[:event])
    if @event.save
      redirect_to team_event_path(@team, @event)
    else
      render :new
    end
  end

  def show
    @event = @team.home_events.find_by_id(params[:id]) 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def load_team
    @team = Team.find(params[:team_id])
  end
end
