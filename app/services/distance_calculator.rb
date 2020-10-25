class DistanceCalculator < ApplicationService
  attr_reader :data, :radius

  def initialize(data, radius)
    @data = data
    @filter_data = []
    @radius = radius #distance for search from given center location in Km
    @earth_radius = 6371 #Radius of Earth in Km
    @center_lat = 52.508283 #given center location latitude
    @center_lon = 13.329657 #given center location longitude
    @center_lat_radian = @center_lat * Math::PI / 180 #given center location latitude value converted into radian
  end

  def call
    @data.each do |customer|
      distance = calculate(customer['latitude'], customer['longitude'])
      if distance <= @radius
        customer.merge!('distance' => distance.round(1))
        @filter_data << customer
      end
    end
    return @filter_data
  end

  private

  def calculate lat, lon
    lat_radian = lat * Math::PI / 180
    lat_distance = (lat - @center_lat) * Math::PI / 180
    lon_distance = (lon - @center_lon) * Math::PI / 180

    a = Math.sin(lat_distance / 2) * Math.sin(lat_distance / 2) + Math.cos(@center_lat_radian) * Math.cos(lat_radian) * Math.sin(lon_distance / 2) * Math.sin(lon_distance / 2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    return @earth_radius * c
  end
end
