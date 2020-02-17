class Booking < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :bike

  # validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :start_must_be_before_end_time if (start_date && end_date)

  private

  # def start_must_be_before_end_time
  #   errors.add(:start_date, "must be before end time") unless start_date <= end_date
  # end
end
