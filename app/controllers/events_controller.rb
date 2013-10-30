class EventsController < ApplicationController
  def index
    @event = @team.events.all
  end

  def new
    @event = @team.events.build
  end

  def create
    @event = @team.events.build(params[:event_id])
    if @event.save
      redirect_to events_team_events_path[@team, @event]
    else
      render :new
    end
  end

  def show
    @event = @team.events.find(params[:id]) 
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
