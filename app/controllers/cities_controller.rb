class CitiesController < ApplicationController
  def show
    @city = params[:id]
  end

  def index
    @cities = City.all
  end
end
