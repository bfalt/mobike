class Motorbike < ApplicationRecord
  has_many :reviews
  has_many :bookings
  belongs_to :user

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