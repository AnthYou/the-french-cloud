class Question < ApplicationRecord
  belongs_to :exercise
  has_many :answers, dependent: :destroy
end
