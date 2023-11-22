class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  # belongs_to :user

  # validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
