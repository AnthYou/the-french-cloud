class Lesson < ApplicationRecord
  CATEGORIES = ['Grammar', 'Verbal tenses', 'Vocabulary & dialogues']
  validates :title, presence: true
  validates :sku, presence: true, uniqueness: true
  validates :level, presence: true, inclusion: { in: User::LEVEL }
  validates :category, inclusion: { in: CATEGORIES }
end
