 class UniversitiesController < ApplicationController
  before_filter :get_university, except: [:index, :new, :create]

  def index
    @universities = University.all
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(params[:university])
    if @university.save
      # flash.now[:success] = 'University added!'
      redirect_to action: :show, id: @university, success: 'University added!'
    else
      # flash.now[:error] = 'There was an error processing your form'
      render :new, error: 'There was an error processing your University'
    end
  end

  def show
    get_teams
  end

  def edit
  end

  def update
    if @university.update_attributes(params[:university])
      redirect_to university_path, flash[:success] = 'University updated!'
    else
      flash.now[:error] = 'There was an error updating your form'
      render :edit
    end
  end

  def destroy
    @university.delete
    flash.now[:notice] = 'You sure?'
    redirect_to universities_path
  end

  private
  def get_university
    @university = University.find(params[:id])
  end

  def get_teams
    get_university
    @teams = @university.teams
  end

  def get_team
    get_university
    @team = @university.teams.find(params[:university_id])
  end
end
