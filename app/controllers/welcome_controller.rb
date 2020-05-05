class WelcomeController < ApplicationController
  def id
    @user = User.find_by(first_name: params[:id])
  end
end
