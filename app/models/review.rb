class Review < ApplicationRecord
  belongs_to :motorbike
  belongs_to :user

  validates :description, length: { minimum: 10 }
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }
end