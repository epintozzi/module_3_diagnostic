class SearchController < ApplicationController

  def index
    results = Faraday.get("http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&location='80216'&fuel_type=ELEC,LPG&limit=10")
binding.pry
    parsed_result = JSON.parse(results.body)
  end

end
