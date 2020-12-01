class Lesson < ApplicationRecord
  CATEGORIES = ['Grammar', 'Verbal tenses', 'Vocabulary & dialogues']
  validates :title, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :level, presence: true, inclusion: { in: User::LEVEL }
  validates :category, inclusion: { in: CATEGORIES }
  has_one :exercise

  def color
    case category
    when CATEGORIES[0]
      'purple'
    when CATEGORIES[1]
      'green'
    when CATEGORIES[2]
      'orange'
    end
  end
end
