class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = Expense.new(expense_params)
    @expense.user = current_user

    if @expense.save

      # Create a new ExpensesGroup record to associate the expense with the group
      @expense.categories << @category

      flash[:success] = 'Expense successfully saved'
      redirect_to category_path(id: params[:category_id])
    else
      flash[:danger] = 'Expense could not be saved'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
