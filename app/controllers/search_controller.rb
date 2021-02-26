class SearchController < ApplicationController
  def index
    @directions = SearchFacade.get_nearest_fuel_station(params[:location])
  end
end
