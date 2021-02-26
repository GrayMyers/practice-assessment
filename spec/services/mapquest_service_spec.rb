require "rails_helper"

describe MapquestService do
  describe "class methods" do
    it "get_directions" do
      loc = "1331+17th+St+LL100%2C+Denver%2C+CO+80202"
      station = NrelService.get_fuel_station(loc)
      directions = MapquestService.get_directions(loc,station)
      expect(directions).to be_a(Directions)
      expect(directions.destination).to eq(station) #ran out of time here, was just trying to get this refactor working before adding more tests.
    end
  end
end
