class TeamsController < ApplicationController
  before_filter :get_university, except: [:index]
  before_filter :get_team, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def new
    @team = @university.teams.build
  end

  def create
    @team = @university.teams.build(params[:team])
    if @team.save
      flash.now[:success] = 'Team created!'
      redirect_to  university_team_path([@univeristy, @team]),  
                   options = {
                                method: :get
                              } 
    else
      flash.now[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
    
  end

  def edit
  end

  def update
    if @team.update_attributes(params[:team])
      flash.now[:success] = 'Team updated!'
      redirect_to controller: 'universities', action: 'show', id: [@university, @team] # university_team_path([@university, @team])
    else
      flash.now[:error] = 'There was an error updating your form'
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    flash.now[:notice] = 'You sure?'
    redirect_to teams_path
  end

  # protected
  # def get_university
  #   @university ||= University.find(params[:id])
  # end

  # def get_team
  #   @team ||= Team.find(params[:id])
  # end

  private
  def get_university
    # @university = University.where("params[:id] = ?", :id)
    # @university = University.find(params[:university_id])
  end

  def get_team
    @team = @university.teams.where("team_id = ?", :id)
  end
end
