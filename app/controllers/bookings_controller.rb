class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit, :destroy]
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @bike = Bike.find(params[:booking][:bike])
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
    authorize @booking
  end
  
  def destroy
    authorize @booking
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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
