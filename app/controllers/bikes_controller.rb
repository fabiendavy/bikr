class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :results]
  before_action :set_bike, only: [:show, :edit, :destroy, :update]

  def index
    @bikes = policy_scope(Bike)

    if params[:search].present? && params[:search][:location] != "" && params[:search][:bike_type] != ""
      redirect_to results_bikes_path(params: { location: params[:search][:location] })
    else
      render :index
    end
  end

  def results
    @location = params[:location]
    @bikes = policy_scope(Bike).geocoded.near(@location, 15)

    @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bike: bike })
      }
    end
  end

  def show
    authorize @bike
    @booking = Booking.new
    @user = current_user
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    authorize @bike
    @bike.user = current_user
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def edit
    authorize @bike
  end

  def update
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render :edit
    end
  end

  def destroy
    authorize @bike
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:bike_type, :description, :location, :price_per_day)
  end
end
