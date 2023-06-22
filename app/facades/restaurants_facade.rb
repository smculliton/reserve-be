class RestaurantsFacade
  def self.get_all_restaurants
    file = File.read('./app/data/restaurants.json')
    data = JSON.parse(file, symbolize_names: true)

    data[:features].map { |r| Restaurant.new(r) }
  end
end