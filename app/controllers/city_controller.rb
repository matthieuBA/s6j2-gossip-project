class CityController < ApplicationController
  def id
    @city = params[:id]
  end
end
