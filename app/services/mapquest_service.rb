class MapquestService
  def self.conn
    map_conn = Faraday.new("https://www.mapquestapi.com/directions/v2/")
  end

  def self.get_directions(start_loc, station)
    response = conn.get("route?key=#{ENV["MAPQUEST_KEY"]}&from=#{start_loc}&to=#{station.address}&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
    json = JSON.parse(response.body)
    Directions.new(json["route"],station)
  end
end
