class AltFuelStations
  attr_reader :name, :address, :fuel_type, :distance, :access_days_time

  def initialize(attributes={})
    @name = attributes[:station_name]
    @address = attributes[:street_address]
    @fuel_type = attributes[:fuel_type_code]
    @distance = attributes[:distance]
    @access_days_time = attributes[:access_days_time]
  end

  def self.find_fuel_stations(zip)
    AltFuelFinderService.new.get_response(zip).map do |station|
      AltFuelStations.new(station)
    end
  end

end
