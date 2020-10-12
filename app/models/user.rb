class User < ApplicationRecord
  LEVEL = %w[A0 A1 A2 B1 B2 C1 C2]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :country, presence: true
  validates :level, presence: true, inclusion: { in: User::LEVEL }
  has_many :checkouts
  has_many :orders
  belongs_to :plan, optional: true
  has_one_attached :photo

  def subscribed?
    subscription_id?
  end
end
