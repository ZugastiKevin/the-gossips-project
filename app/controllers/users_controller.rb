class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.errors.full_messages
    if @user.save
      flash[:success] = "Votre compte a été créé avec succès !"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end


  def destroy
  end
#=======================================================================================================================
  private

  def user_params
    params.require(:user).permit(:city_name, :first_name, :last_name, :description, :age, :email, :password, :password_confirmation)
  end
end
