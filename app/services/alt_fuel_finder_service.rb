class AltFuelFinderService
  attr_reader :conn

  def initialize
    @conn = Faraday.new(:url => 'http://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def get_response
    response = conn.get("?api_key=#{ENV['nrel_api_key']}&location=#{params[:q]}&fuel_type=ELEC,LPG&limit=10")

    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
end
