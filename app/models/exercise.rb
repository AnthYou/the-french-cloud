class Exercise < ApplicationRecord
  CATEGORIES = ['Listening', 'Reading', 'Grammar']
  validates :sku, presence: true, uniqueness: true
  validates :title, presence: true
  validates :level, presence: true, inclusion: { in: User::LEVEL }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_many :questions
end
