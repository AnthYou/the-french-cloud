class Plan < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  monetize :price_cents
  has_many :users
end
