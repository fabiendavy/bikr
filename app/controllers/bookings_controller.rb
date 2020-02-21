class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :edit, :destroy]
  before_action :set_bike, only: [:update, :edit]

  def index
    @bookings = policy_scope(Booking).where(user: current_user)
  end

  def show
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    @booking.total_price = @bike.price_per_day * (@booking.end_date - @booking.start_date + 1)

    if @booking.save
      # redirect_to booking_path(@booking)
    else
      render "bikes/show"
    end
  end

  def edit
    authorize @booking
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to my_dashboard_path
  end

  def update
    authorize @booking
    @booking.total_price = Bike.find(Booking.find(params[:id]).bike_id).price_per_day * (@booking.end_date - @booking.start_date + 1)
    if @booking.update(booking_params)
      redirect_to my_dashboard_path(@booking)
    else
      render "bikes/show"
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_bike
    @bike = Bike.find(Booking.find(params[:id]).bike_id)
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :bike_id)
  end
end
