require "rails_helper"

describe Directions do
  it "exists" do
    sample_station_data = {
      "station_name" => "Fuel Station 1",
      "fuel_type_code" => "ELEC",
      "access_days_time" => "Closes at 6",
      "street_address" => "123 fake street",
      "city" => "fake town",
      "state" => "XX",
      "country" => "madeupland"
    }

    sample_station = FuelStation.new(sample_station_data)

    sample_data = {
      "distance" => 1,
      "realTime" => 5,
      "legs" => [
        "maneuvers" => [
          {"narrative" => "1"}, {"narrative" => "2"}, {"narrative" => "3"} #please dont change this
        ]
      ]
    }

    directions = Directions.new(sample_data,sample_station)

    expect(directions.distance).to eq(sample_data["distance"])
    expect(directions.time).to eq(sample_data["realTime"])
    expect(directions.step_directions).to eq(["1","2","3"])
    expect(directions.destination).to eq(sample_station)
  end
end
