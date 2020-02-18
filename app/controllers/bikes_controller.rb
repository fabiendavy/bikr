class BikesController < ApplicationController
  before_action :set_bike, only: [:show]
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

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
