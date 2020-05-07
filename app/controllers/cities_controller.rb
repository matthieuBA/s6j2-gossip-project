class CitiesController < ApplicationController
  before_action :authenticate_user

  def show
    @city = params[:id]
  end

  def index
    @cities = City.all
  end
end
