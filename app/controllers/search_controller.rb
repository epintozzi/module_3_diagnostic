class SearchController < ApplicationController

  def index
    response = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&location='80216'&fuel_type=ELEC,LPG&limit=10")
# binding.pry
    parsed_response = JSON.parse(response.body)
    @fuel_stations = parsed_response["fuel_stations"]
    # @name = parsed_response["fuel_stations"].first["station_name"]
    # @address
    # @distance
    # @access_time
    # @fuel_type
  end

end
