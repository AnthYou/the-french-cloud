class Exercise < ApplicationRecord
  CATEGORIES = ['Listening', 'Reading', 'Grammar', 'Verbal tenses']
  NATURES = ['MCQ', 'Blanks']
  validates :sku, presence: true, uniqueness: true
  validates :title, presence: true
  validates :level, presence: true, inclusion: { in: User::LEVEL }
  validates :nature, presence: true, inclusion: { in: NATURES }
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  has_many :questions, dependent: :destroy
  belongs_to :lesson, optional: true

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
