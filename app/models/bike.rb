class Bike < ApplicationRecord
    # associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  
  include PgSearch::Model
  pg_search_scope :bike_search,
  against: [ :location, :bike_type, :size, :electric ],
  associated_against: {
    user: [ :username ]
  },
  using: {
    tsearch: { prefix: true }
  }
  
  geocoded_by :location

  # BIKE_TYPES = ["Mountain", "Road", "Time Trial", "Gravel Cyclocross", "BMX", "Single Speed", "Cruiser", "Urban", "Hybrid", "Touring", "Other"]
  BIKE_TYPES = ["Trail", "Road", "BMX", "Urban", "Cruiser"]
  BIKE_SIZE = ["S", "M", "L"]
  BIKE_GENDER = ["Female", "Male"]
  BIKE_POWER = ["Your legs", "Electric"]

  # validations
  validates :bike_type, presence: true, inclusion: { in: BIKE_TYPES }
  validates :location, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  after_validation :geocode, if: :will_save_change_to_location?
end
