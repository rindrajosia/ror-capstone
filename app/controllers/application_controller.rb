class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:auth]
      @current_user = User.find(session[:auth]['id'])
    else
      redirect_to new_user_path
    end
  end

  def signin
    redirect_to articles_path if session[:auth]
  end

  def create_categories
    return if Categorie.exists?

    Categorie.create(name: 'Tv', priority: 1)
    Categorie.create(name: 'Radio', priority: 2)
    Categorie.create(name: 'Car', priority: 3)
    Categorie.create(name: 'Train', priority: 4)
  end
end
