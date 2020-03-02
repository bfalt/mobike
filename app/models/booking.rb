class Booking < ApplicationRecord
  belongs_to :motorbike
  belongs_to :user
end
