class BikesController < ApplicationController
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
    # @query = params[:search]
    # if !@query.nil?
    #   @name = @query[:query]
    #   @cocktails = Cocktail.select do |cocktail|
    #     cocktail.name.include?(@name)
    #   end
    # end
  end
end
