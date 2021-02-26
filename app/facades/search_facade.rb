class SearchFacade
  def self.get_nearest_fuel_station(starting_loc)
    fuel_station = NrelService.get_fuel_station(starting_loc)
    MapquestService.get_directions(starting_loc, fuel_station)
  end
end
