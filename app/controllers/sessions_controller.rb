class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :create]

  def new
    puts "=" * 100
    puts params[:remember_check]
  end

  def login
    puts "=" * 100
    puts params[:remember_check]
  end

  def create

    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: params[:email])

    user = User.find_by(email: params[:email])
    puts "=" * 100
    puts params[:remember_check]
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if @user && @user.authenticate(params[:password])
      puts "_" * 100
      puts params[:remember_check]
      @user.update(params.permit(:remember_check))
      session[:user_id] = @user.id
      flash.now[:danger] = "CONNECTED"
      # on va cuisiner le cookie pour l'utilisateur
      if @user.remember_check
        remember(user)
      end

      # redirige où tu veux, avec un flash ou pas

      # redirige où tu veux, avec un flash ou pas
      redirect_to gossips_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      # redirect_to new_user_path
      redirect_to new_session_path
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    # puts "user_id = #{user.id}"
    puts "user_id = #{user}"
    # session.delete(:user_id)
    log_out(user)
    flash.now[:danger] = "DISCONNECTED"
    puts "DISCONNECTED"
    redirect_to new_session_path
  end
end
