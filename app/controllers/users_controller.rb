class UsersController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]
  
  def index
    
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = current_user.users.new(user_params)
    
    if user.save
      redirect_to users_path
      else
      # if the record doesnt save because it didnt pass the validations
      flash[:message] = user.errors.messages
      
      redirect_to :back
    end
  end     
  
  def edit
    @user = User.find(params[:id])
  end

  def show
    
    @user = User.find(params[:id])
    
  end

  # this is only for internal use.
  private
    def user_params
      params.require(:user).
        permit(:id, :name, :title, :email, :hospital, :dob)
    end
end
