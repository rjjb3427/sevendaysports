class TeamsController < ApplicationController
  before_filter :get_university, except: :index

  def index
    @teams = Team.all
    # @teams = @university.teams
  end

  def new
    @team = @university.teams.build
  end

  def create
    @team = @university.teams.build(params[:team])
    if @team.save
      flash[:success] = 'Team created!'
      redirect_to  university_team_path([@univeristy, @team]),  
                   options = {
                              method: :get
                              } 
    else
      flash[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
    @team = @university.teams.find(params[:id])
  end

  def edit
  end

  def update
    if @team.update_attributes(params[:team])
      flash[:success] = 'Team updated!'
      redirect_to team_path
    else
      flash[:error] = 'There was an error updating your form'
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash[:notice] = 'You sure?'
    redirect_to teams_path
  end

  private
  def get_university
    @university = University.where("params[:id] = ?", :id)
  end
  def get_team
    @team = @university.teams.where("team_id = ?", :id)
  end
end
