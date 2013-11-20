class ArticlesController < ApplicationController
  before_filter :get_event

  def index
    @articles = @event.articles
  end

  def new
    @article = @event.articles.build
  end

  def create
    @article = @event.articles.build(params[:article])
    if @article.save
      redirect_to [@event, @article]
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update_attributes(params[:article])
      flash[:success] = 'Article updated'
      redirect_to [@event, @article], id: params[:id]
    else
      render :edit, flash[:error] = 'Unable to update article'
    end
  end

  def destroy
    @article.delete
    flash[:notice] = 'You sure?'
    redirect_to event_articles_path
  end

  private
  def get_event(event_id)
    if has_event?
      @event = @event.articles.find(params[:id])
    else
      Event.find(params[:id])
    end
  end

  def has_event?
    @event.present?
  end
end
