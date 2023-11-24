class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  # has_many :recipes, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 250 }
  validates :measurement_unit, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
end
