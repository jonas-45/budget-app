class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expenses, dependent: :destroy
  has_many :categories, through: :category_expenses
end
