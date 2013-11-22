class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    # get_event
    # @articles = @event.articles
  end

  def new
    get_event
    @article = @event.articles.build
  end

  def create
    get_event
    @article = @event.articles.build(params[:article])
    if @article.save
      flash[:success] = 'Article created!'
      redirect_to [@event, @article]
    else
      flash[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
    get_event
  end

  def edit
    get_event
  end

  def update
    get_event
    if @article.update_attributes(params[:article])
      flash[:success] = 'Article updated!'
      redirect_to [@event, @article], id: params[:id]
    else
      render :edit, flash[:error] = 'There was an error updating your form'
    end
  end

  def destroy
    get_event
    @article.delete
    flash[:notice] = 'You sure?'
    redirect_to event_articles_path
  end

  private
  def get_event
    # if event_exists?
      @event = Event.find_by_id(params[:id])
    # else
    #   "No Events Present"
    # end
  end
  def event_exists?
    @event.present?
  end
end
