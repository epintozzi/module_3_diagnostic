class SearchController < ApplicationController

  def index
    # response = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&location=#{params[:q]}&fuel_type=ELEC,LPG&limit=10")
    #
    # parsed_response = JSON.parse(response.body)
    parsed_response = AltFuelFinderService.get_response
    @fuel_stations = parsed_response["fuel_stations"]
  end

end
