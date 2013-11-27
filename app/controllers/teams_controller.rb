class TeamsController < ApplicationController
  # before_filter :get_university
  # before_filter :get_team

  def index
    @university = University.find(params[:university_id])
    @teams = @university.teams
  end

  def new
    @team = @university.teams.build
  end

  def create
    @team = @university.teams.build(params[:team])
    if @team.save
      redirect_to [@university, @team], success: 'Team created!'
      # flash.now[:success] = 'Team created!'
      # redirect_to university_teams_path(@university), success: 'Team created!'
      # redirect_to  university_team_path([@univeristy, @team]),  
      #              options = {
      #                           method: :get
      #                         } 
    else
      # flash.now[:error] = 'There was an error processing your form'
      render :new, error: 'There was an error processing your team'
    end
  end

  def show
    @university = University.find(params[:university_id])
    @team = @university.teams.find(params[:id])
  end

  def edit
    @university = University.find(params[:id])
    @team = @university.teams.find(params[:id])
  end

  def update
    @university = University.find(params[:id])
    @team = @university.teams.find(params[:id])
    if @team.update_attributes(params[:team])
      flash.now[:success] = 'Team updated!'
      redirect_to(@team, success: 'Team successfully updated')
      # redirect_to controller: 'universities', action: 'show', id: [@university, @team] # university_team_path([@university, @team])
    else
      # flash.now[:error] = 'There was an error updating your form'
      render(:edit, error: 'There was an error updating your team')
    end
  end

  def destroy
    @university = University.find(params[:id])
    @team = @university.teams.find(params[:id])
    @team.destroy
    redirect_to(teams_path, notice: 'You sure?')
  end

  private 
  def get_university
    @university = University.find(params[:university_id])
  end

  def get_team 
    @team = @university.teams.find(params[:id])
  end
end
