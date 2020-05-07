class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def login
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash.now[:danger] = "CONNECTED"
      # log_in(user)
      # redirige où tu veux, avec un flash ou pas
      redirect_to gossips_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      # redirect_to new_user_path
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash.now[:danger] = "DISCONNECTED"
    redirect_to new_user_path
  end
end
