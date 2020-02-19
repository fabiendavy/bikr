class Bike < ApplicationRecord
  # associations
  belongs_to :user
  has_many :bookings, dependent: :destroy

  geocoded_by :location

  # validations
  # BIKE_TYPES = ["Mountain", "Road", "Time Trial", "Gravel Cyclocross", "BMX", "Single Speed", "Cruiser", "Urban", "Hybrid", "Touring", "Other"]
  BIKE_TYPES = ["Trail", "Road", "BMX", "Urban", "Cruiser"]

  validates :bike_type, presence: true, inclusion: { in: BIKE_TYPES }
  validates :location, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  after_validation :geocode, if: :will_save_change_to_location?
end
