class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  before_action :set_bike, only: [:show, :edit, :destroy, :update]
  def index
    @bikes = Bike.all
    @query = params[:search]

    if !@query.nil?
      @location = @query[:location]
      @available_bikes = Bike.select do |bike|
        bike.location.include?(@location)
      end
    else
      render :index
    end
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to bike_path(@bike)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:bike_type, :description, :location, :price_per_day)
  end
end
