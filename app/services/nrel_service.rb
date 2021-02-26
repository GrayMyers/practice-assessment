class NrelService
  def self.conn
    rel_conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/")
  end

  def self.get_fuel_station(loc)
    from_location = loc.gsub(" ","+")
    response = conn.get("nearest.json?api_key=#{ENV["NREL_KEY"]}&location=#{from_location}")
    json = JSON.parse(response.body)["fuel_stations"][0]
    FuelStation.new(json)
  end
end
