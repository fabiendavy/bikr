class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit, :destroy]
  def index
    @bookings = Booking.all
  end

  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @bike = Bike.find(params[:bike_id])
    @booking.user = current_user
    @booking.total_price = @bike.price_per_day * (@booking.end_date - @booking.start_date)
    @booking.bike = @bike

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "bikes/show"
    end
  end

  def edit
  end

  def destroy
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render "bikes/show"
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user, :bike, :start_date, :end_date)
  end
end
