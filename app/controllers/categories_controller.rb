class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :require_admin, only: %i[new create]
  def index; end

  def new
    @category = Category.new
  end

    def show 
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Create category successfully'
      redirect_to @category
    else
      render :new
    end
  end



  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
   unless isLoggedIn? && current_user.admin?
    flash[:alert] = "You have to be admin to create category"
    redirect_to categories_path
  end
  end
end
