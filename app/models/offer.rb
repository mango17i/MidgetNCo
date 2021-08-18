class Offer < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :photo

  # validates :title, length: { minimum: 8, maximum: 20 }
  # validates :description, length: { maximum: 140 }
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
end
