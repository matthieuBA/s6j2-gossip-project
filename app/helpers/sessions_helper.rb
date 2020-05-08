module SessionsHelper
  def log_in(user)
    puts "#" * 100
    puts "log_in"
    puts "#" * 100
    session[:user_id] = user.id
  end

  def logged_in?
    puts "#" * 100
    puts "logged in ?"
    puts "#" * 100
    !current_user.nil?
  end

  def authorized
    puts "#" * 100
    puts "autorized"
    puts "#" * 100
    # redirect_to new_user_path unless logged_in?
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
    puts "#" * 100
    puts "authenticate"
    puts "#" * 100
  end

  def remember(user)
    puts "#" * 100
    puts "remember"
    puts "#" * 100
    # ici je vais créer un remember_token qui est une suite aléatoire de caractères
    remember_token = SecureRandom.urlsafe_base64

    # j'ai mon token, je vais stocker son digest en base de données :
    user.remember(remember_token)

    #  maintenant, je vais créer les cookies : un cookie qui va conserver l'user_id, et un autre qui va enregistrer le remember_token
    cookies.permanent[:user_id] = user.id
    cookies.permanent[:remember_token] = remember_token
  end

  def current_user
    if session[:user_id]
      puts "#" * 100
      puts "session"
      puts "#" * 100
      current_user = User.find_by(id: session[:user_id])
    elsif cookies[:user_id]
      puts "#" * 100
      puts "cookies"
      puts "#" * 100
      user = User.find_by(id: cookies[:user_id])
      if user && BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
        log_in user
        current_user = user
      end
    end
  end

  def forget(user)
    puts "#" * 100
    puts "forget"
    puts "#" * 100
    puts "users = #{user}"
    puts "users = #{@user}"

    # on remet le remember_digest à nil puisqu'il ne nous servira plus :
    unless user.nil?
      user.update(remember_digest: nil)
      user.update(remember_check: false)
    end
    # on efface les cookies dans le navigateur de l'utilisateur
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out(user)
    # user = User.find_by()
    puts "#" * 100
    puts "log_out"
    puts "#" * 100
    puts "user= #{user}"
    forget(user)
    session.delete(:user_id)
  end
end
