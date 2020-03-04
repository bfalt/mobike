class Motorbike < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :user
  has_many_attached :photos

  geocoded_by :address, if: :will_save_change_to_address?
  after_validation :geocode

  validates :name, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :address, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
