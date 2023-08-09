class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.categories.all.order(created_at: :desc).includes(:expenses)
  end

  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses.order(created_at: :desc)
    @total_expenses = @category.expenses.sum(:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      flash[:success] = "Category successfully added"
      redirect_to authenticated_root_path
    else
      flash[:danger] = "Category could not be created"
      render :new
    end
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
