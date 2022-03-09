class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[show index]
  before_action :require_same_user, only: %i[edit update destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.user = current_user
    if @article.save
      flash[:notice] = 'Article created successfully'
      redirect_to @article
    else
      render :new
    end
  end

  def edit

  end

  def update
    @article.user ||= current_user
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article updated successfully'
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = 'You dont have permission to perform this action'
      redirect_to @article
    end
  end
end
