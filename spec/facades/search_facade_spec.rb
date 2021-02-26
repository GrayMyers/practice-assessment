require "rails_helper"
descirbe SearchFacade do
  describe "class methods" do
    it "get_nearest_fuel_station" do
      loc = "1331+17th+St+LL100%2C+Denver%2C+CO+80202"
      directions = SearchFacade.get_nearest_fuel_station(loc)
      expect(directions).to be_a(Directions)
      expect(directions.destination).to be_a(FuelStation)
      #ran out of time here, was just trying to get this refactor working before adding more tests.

    end
  end
end
