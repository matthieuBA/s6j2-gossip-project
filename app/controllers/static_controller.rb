class StaticController < ApplicationController
  def index
    Gossip.all
  end

  def team
  end

  def contact
  end

  def login
    @user = User.find_by(params[:email])
    user = User.find_by(params[:email])
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      # redirige où tu veux, avec un flash ou pas
      redirect_to gossips_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      redirect_to new_user_path
    end
  end
end
