class TeamsController < ApplicationController
  before_filter :get_university

  def index
    @teams = @university.teams
  end

  def new
    @team = @university.teams.build
  end

  def create
    @team = @university.teams.build(params[:team])
    if @team.save
      flash[:success] = 'Team created!'
      redirect_to action: :show, id: :team_id 
    else
      flash[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @team.update_attributes(params[:team])
      flash[:success] = 'Team updated!'
      redirect_to team_path
    else
      flash[:error] = 'There was an error processing your form'
      render :edit
    end
  end

  def destroy
    @team.delete
    flash[:notice] = 'You sure?'
    redirect_to teams_path
  end

  private
  def get_university
    if has_university?
      @team = @university.teams.find(params[:id])
    else
      University.find(params[:id])
    end
  end

  def has_university?
    @university.teams.present?
  end
end
