class Motorbike < ApplicationRecord
  CATEGORIES = ['Moped','Naked Bike', 'Super Bike', 'Cafe Racer', 'Enduro', 'Hard Tail', 'Cruiser', 'Custom']
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  belongs_to :user
  has_many_attached :photos

  geocoded_by :address, if: :will_save_change_to_address?
  after_validation :geocode

  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_make_and_model_and_address_and_category,
    against: [ :make, :model, :address, :category ],
    using: {
      tsearch: { prefix: true }
  }

  include AlgoliaSearch

  algoliasearch do
    attributes :make, :model, :address, :category
  end

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
