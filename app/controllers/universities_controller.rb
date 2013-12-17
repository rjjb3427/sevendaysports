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
      redirect_to  @university, success: 'University added!'
    else
      render :new, error: 'There was an error processing your University'
    end
  end

  def show
    @teams = @university.teams
  end

  def edit
  end

  def update
    if @university.update_attributes(params[:university])
      redirect_to @university, method: :put, success: 'University updated!'
    else
      render :edit, error: 'There was an error updating your University'
    end
  end

  def destroy
    @university.delete
    redirect_to universities_path, notice: 'You sure?'
  end

  private
  def get_university
    @university = University.find(params[:id])
  end
end
