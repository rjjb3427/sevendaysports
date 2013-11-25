 class UniversitiesController < ApplicationController
  def index
    # @university = University.where("university_id = ?", :university_id)
    @team = Team.where('id < 100').where('name ASC')
    @universities = University.all
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(params[:university])
    if @university.save
      flash[:success] = 'University added!'
      redirect_to university_team_path([@university, @team])
    else
      flash[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
    get_university
    @teams = @university.teams
  end

  def edit
    get_university
  end

  def update
    get_university
    if @university.update_attributes(params[:university])
      flash[:success] = 'University updated!'
      redirect_to university_path
    else
      flash[:error] = 'There was an error updating your form'
      render :edit
    end
  end

  def destroy
    get_university
    @university.delete
    # flash[:notice] = 'You sure?'
    redirect_to universities_path
  end

  private
  def get_university
    @university = University.find(params[:id])
  end

  # def get_team
  #   get_university
  #   @team = @university.teams.find(params[:id])
  # end
end
