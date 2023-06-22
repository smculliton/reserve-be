class Api::V1::RestaurantsController < ApplicationController
  def index
    restaurants = RestaurantsFacade.get_all_restaurants
    restaurants = restaurants.select { |r| r.cuisine.include?(params[:cuisine]) } if params[:cuisine]

    render json: RestaurantSerializer.new(restaurants)
  end
end