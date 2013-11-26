class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash.now[:success] = 'Article created!'
      redirect_to @article
    else
      flash.now[:error] = 'There was an error processing your form'
      render :new
    end
  end

  def show
    get_article
  end

  def edit
    get_article
  end

  def update
    get_article
    if @article.update_attributes(params[:article])
      flash.now[:success] = 'Article updated!'
      redirect_to [@event, @article], id: params[:id]
    else
      render :edit, flash.now[:error] = 'There was an error updating your form'
    end
  end

  def destroy
    get_article
    @article.delete
    redirect_to articles_path
  end

  private
  def get_article
    @article = Article.find(params[:id])
  end
end
