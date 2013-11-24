class MediasController < ApplicationController  
  before_filter :load_mediable

  def index
    @medias = @mediable.medias
    # @event_mediable = Event.find(params[:event_id]) 
    # @team_mediable = Team.find_by_id(params[:team_id])
    # @user_mediable = User.find_by_id(params[:user_id])
  end

  def new
    @media = @mediable.medias.new
  end

  def create
    @media = @mediable.medias.new(params[:media])
    if @media.save
      flash[:success] = 'Media created!'
      redirect_to [@mediable, :medias]
    else
      flash[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
    # @event_media = @event.medias.find_by_id(params[:id])
    # @team_media = @team.medias.find_by_id(params[:id])
    # @user_media = @user.medias.find_by_id(params[:id])
  end

  def update
    if @media.update_attributes(params[:media])
      flash[:success] = 'Media updated!'
      redirect_to [@event, @media], id: params[:id]
    else
      render :edit, flash[:error] = 'There was an error updating your form'
    end
  end

  def edit
  end

  def destroy
    @media.delete
    flash[:notice] = 'You sure?'
    redirect_to medias_path
  end

  private
  def load_mediable
    klass = [Event, Team, User].detect { |m| params["#{m.name.underscore}_id"] }
    @mediable = klass.find(params["#{klass.name.underscore}_id"])
  end

  # def load_mediable
  #   resource, id = request.path.split('/')[1, 2]
  #   @mediable = resource.singularize.classify.constantize.find(id)
  # end
end
