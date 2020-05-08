module ApplicationHelper
  def flash_class(level)
    case level
    when "notice" then "alert alert-info"
    when "success" then "alert alert-success"
    when "error" then "alert alert-danger"
    when "alert" then "alert alert-danger"
    end
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
end
