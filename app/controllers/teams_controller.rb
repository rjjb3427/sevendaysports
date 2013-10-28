class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    # @university = University.find(params[:id])
    # @team = @university.teams.build(params[:team])
    @team = Team.new(params[:team])
    if @team.save
      redirect_to action: :show, id: :team_id 
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to team_path
    else
      render :edit
    end
  end

  def destroy
  end
end
