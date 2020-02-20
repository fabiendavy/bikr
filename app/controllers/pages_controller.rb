class PagesController < ApplicationController
  def my_dashboard
    @bookings = Booking.where(user: current_user)
    @bikes = Bike.where(user: current_user)
  end

  def profile
  end
end
