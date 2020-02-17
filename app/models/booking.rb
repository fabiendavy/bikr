class Booking < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :bike

  # validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  # validates :start_must_be_before_end_time

  private

  def start_must_be_before_end_time
    errors.add(:start_time, "must be before end time") unless start_time < end_time
  end
end
