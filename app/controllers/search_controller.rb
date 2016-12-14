class SearchController < ApplicationController

  def index
    binding.pry
    search = Faraday.get("developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=ENV['nrel_api_key']&location='80216'&fuel_type=ELEC,LPG&limit=10")
  end

end
