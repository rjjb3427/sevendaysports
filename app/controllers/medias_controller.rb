class MediasController < ApplicationController
  before_filter :get_event
  
  def index
    @medias = @event.medias
  end

  def new
    @media = @event.medias.build
  end

  def create
    @media = @event.medias.build(params[:@media])
    if @media.save
      flash[:success] = 'Media created!'
      redirect_to [@event, @media]
    else
      flash[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
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
  def get_event
    if has_event?
      @event = @event.medias.find(params[:id])
    else
      Event.find(params[:id])
    end
  end

  def has_event?
    @event.medias.present?
  end
end
