class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_many :category_expenses, dependent: :destroy
  has_many :expenses, through: :category_expenses

  validates :name, presence: true
  validates :name, length: {maximum: 30}
end
