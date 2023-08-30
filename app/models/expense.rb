class Expense < ApplicationRecord
  belongs_to :user
  has_many :category_expenses, dependent: :destroy
  has_many :categories, through: :category_expenses

  validates :name, presence: true
  validates :amount, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }
end
