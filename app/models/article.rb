class Article < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :photo, presence: true
  has_one_attached :photo
  has_rich_text :rich_body
  belongs_to :user
end
