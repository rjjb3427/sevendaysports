class TeamsController < ApplicationController
  # before_filter :get_university
  # before_filter :get_team

  def index
    # @university = University.find(params[:id])
    @teams = Team.all
  end

  def new
    @university = University.find(params[:university_id])
    @team = @university.teams.build
  end

  def create
    @university = University.find(params[:university_id])
    @team = @university.teams.build(params[:team])
    if @team.save
      redirect_to [@university, @team], success: 'Team created!'
    else
      render :new, error: 'There was an error processing your team'
    end
  end

  def show
    @team = Team.find(params[:id])
    # @university = University.find(params[:university_id])
    # @team = @university.teams.find(params[:id])
    # @team = @university.teams.where(university_id: @university, id: @team)
  end

  def edit
    @university = University.find(params[:university_id])
    @team = @university.teams.find(params[:id])
  end

  def update
    @university = University.find(params[:university_id])
    @team = @university.teams.find(params[:id])
    if @team.update_attributes(params[:team])
      redirect_to([@university, @team], success: 'Team successfully updated')
    else
      render(:edit, error: 'There was an error updating your team')
    end
  end

  def destroy
    @university = University.find(params[:university_id])
    @team = @university.teams.find(params[:id])
    @team.destroy
    redirect_to university_teams_path(@university)
  end

  private 
  def get_university
    @university = University.find(params[:university_id]) # can't find object without id
  end

  def get_team 
    @team = @university.teams.find(params[:id])
  end
end
