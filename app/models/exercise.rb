class Exercise < ApplicationRecord
  CATEGORIES = ['Listening', 'Reading', 'Grammar']
  validates :sku, presence: true, uniqueness: true
  validates :title, presence: true
  validates :level, presence: true, inclusion: { in: User::LEVEL }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_many :questions

  def color
    case category
    when CATEGORIES[0]
      'blue'
    when CATEGORIES[1]
      'grey'
    when CATEGORIES[2]
      'purple'
    end
  end
end
