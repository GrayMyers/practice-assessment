require "rails_helper"

describe FuelStation do
  it "exists" do
    sample_data = {
      "station_name" => "Fuel Station 1",
      "fuel_type_code" => "ELEC",
      "access_days_time" => "Closes at 6",
      "street_address" => "123 fake street",
      "city" => "fake town",
      "state" => "XX",
      "country" => "madeupland"
    }

    station = FuelStation.new(sample_data)

    expect(station.name).to eq(sample_data["station_name"])
    expect(station.fuel_type).to eq(sample_data["fuel_type_code"])
    expect(station.access_times).to eq(sample_data["access_days_time"])
    expect(station.address).to eq(sample_data["street_address"] +", " + sample_data["city"] + ", " + sample_data["state"] + ", " + sample_data["country"])
  end
end
