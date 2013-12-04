class ArticlesController < ApplicationController
  before_filter :get_article, except: [:index, :new, :create]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, success: 'Article created!'
    else
      render :new, error: 'There was an error proccessing your form'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update_attributes(params[:article])
      flash.now[:success] = 'Article updated!'
      redirect_to [@event, @article], id: params[:id]
    else
      render :edit, flash.now[:error] = 'There was an error updating your form'
    end
  end

  def destroy
    @article.delete
    redirect_to articles_path
  end

  private
  def get_article
    @article = Article.find(params[:id])
  end
end
