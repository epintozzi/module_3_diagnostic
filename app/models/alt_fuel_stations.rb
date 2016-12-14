class AltFuelStations
  attr_reader :name, :address, :fuel_type, :distance, :access_days_time

  def initialize(attributes={})
    @name = attributes["station_name"]
    @address = attributes["street_address"]
    @fuel_type = attributes["fuel_type_code"]
    @distance = attributes["distance"]
    @access_days_time = attributes["access_days_time"]
  end

  def find_fuel_stations
    AltFuelFinderService.new.get_response.map do |station|
      AltFuelStations.new(station)
    end
  end

end
