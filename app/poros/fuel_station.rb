class FuelStation
  attr_reader :name, :fuel_type, :access_times, :address

  def initialize(data)
    @name = data["station_name"]
    @fuel_type = data["fuel_type_code"]
    @access_times = data["access_days_time"]
    @address = data["street_address"] +", " + data["city"] + ", " + data["state"] + ", " + data["country"]
  end
end
