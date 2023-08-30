require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  describe 'GET /categories/:id/expenses' do
    before(:each) do
      @user = User.create(name: 'Jonas', email: 'jonas@gmail.com', password: 'jonas1234')
      @user.save
      sign_in @user
      @category = Category.create(name: 'Car', user_id: @user.id)
      @expense = Expense.create(name: 'Repair', amount: 50, user_id: @user.id)
      get new_category_expense_path(@category)
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render the new page' do
      expect(response).to render_template(:new)
    end
  end
end
