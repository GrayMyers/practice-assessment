class SearchController < ApplicationController
  def index
    from_location = params[:location].gsub(" ","+")
    rel_conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/")
    map_conn = Faraday.new("https://www.mapquestapi.com/directions/v2/")

    response1 = rel_conn.get("nearest.json?api_key=#{ENV["NREL_KEY"]}&location=#{from_location}")
    json = JSON.parse(response1.body)["fuel_stations"][0]
    to_location = json["street_address"] +", " + json["city"] + ", " + json["state"] + ", " + json["country"]
    response2 = map_conn.get("route?key=#{ENV["MAPQUEST_KEY"]}&from=#{from_location}&to=#{to_location}&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
    json2 = JSON.parse(response2.body)
    require "pry"; binding.pry
    #json["station_name"], json["fuel_type_code"],json["access_days_time"], json2["route"]["distance"], json2["route"]["realTime"], json2["route"]["legs"][0]["maneuvers"]
    # name, address, fuel type, access times, distance, travel time, directions
  end
end
