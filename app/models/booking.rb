class Booking < ApplicationRecord
  belongs_to :motorbike
  belongs_to :user
  has_one :review
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  before_save :set_total_price

  private

  def set_total_price
    self.total_price = ((self.end_date - self.start_date).to_i + 1)* self.motorbike.price
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "Must be after the start date!")
    end
  end
end
