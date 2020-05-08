class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]
  before_action :authenticate_user, only: [:index, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:email, :password, :first_name, :last_name, :city_id, :remember_check))
    if @user.remember_check
      remember(@user)
    end
    session[:user_id] = @user.id
    redirect_to gossips_path
  end

  def show
    @user = params[:id]
  end

  def index
    @users = User.all
  end
end
