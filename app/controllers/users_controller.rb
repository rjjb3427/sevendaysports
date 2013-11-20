class UsersController < ApplicationController
  before_filter :get_user

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save 
      flash[:success] = 'User created!'
      redirect_to @user
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
    if @user.update_attributes(params[:admin])
      flash[:success] = 'User updated!'
      redirect_to :show
    else
      flash[:error] = 'There was an error updating your form'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'You sure?'
    redirect_to users_path
  end

  private
  def get_user
    @user.find(params[:id])
  end
end
