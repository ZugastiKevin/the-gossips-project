class SessionsController < ApplicationController
  def new
    @session = User.new(session[:user_id])
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email].downcase)

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = 'Email ou mot de passe invalide :('
      #redirect_to ""
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
