class UniversitiesController < ApplicationController
  def index
    @universities = University.all
  end

  def new
    @university = University.new
  end

  def create
    @university = University.new(params[:university])
    if @university.save
      redirect_to @university
    else
      render :new
    end
  end

  def show
    @university = University.find(params[:id])
  end

  def edit
    @university = University.find(params[:id])
  end

  def update
    @university = University.find(params[:id])
    if @university.update_attributes(params[:university])
      redirect_to university_path
    else
      render :edit
    end
  end

  def destroy
    @user = University.find(params[:id])
    @user.destroy
    redirect_to universities_path
  end
end
