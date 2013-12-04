class TeamsController < ApplicationController
  before_filter :get_university, except: :index
  before_filter :get_team, except: [:index, :new, :create]

  def index
    @teams = Team.all
  end

  def new
    @team = @university.teams.build
  end

  def create
    @team = @university.teams.build(params[:team])
    if @team.save
      redirect_to [@university, @team], success: 'Team created!'
    else
      render :new, error: 'There was an error processing your team'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @team.update_attributes(params[:team])
      redirect_to([@university, @team], success: 'Team successfully updated')
    else
      render(:edit, error: 'There was an error updating your team')
    end
  end

  def destroy
    @team.destroy
    redirect_to university_teams_path(@university)
  end

  private 
  def get_university
    @university = University.find(params[:university_id])
  end

  def get_team 
    @team = @university.teams.find(params[:id])
  end
end
