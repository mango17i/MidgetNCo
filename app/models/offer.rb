class Offer < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :title, length: { minimum: 8, maximum: 20 }
  validates :description, length: { minimum: 30 }
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :address, presence: true
end
