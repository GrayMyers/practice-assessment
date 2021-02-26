class Directions
  attr_reader :distance, :time, :step_directions, :destination

  def initialize(data, destination)
    @distance = data["distance"]
    @time = data["realTime"]
    @step_directions = create_directions(data["legs"][0]["maneuvers"])
    @destination = destination
  end

  private

  def create_directions(directions_data)
    directions_data.map do |direction|
      direction["narrative"]
    end
  end
end
