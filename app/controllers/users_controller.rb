class UsersController < ApplicationController

before_action :authenticate_user!, only: [:new, :create]
  
  def index
    
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = current_user.users.new(dog)
    
    if user.save
      redirect_to users_path
      else
      # if the record doesnt save because it didnt pass the validations
      flash[:message] = user.errors.messages
      
      redirect_to :back
    end
  end     
  
  def edit
    @user = current_user
  end

  def update
   user = User.find(params[:id])
   user.update!(dog)
   redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
  end

 
  # this is only for internal use.
  private
    def dog
      params.require(:user).
        permit(:id, :name, :title, :email, :hospital, :dob, :is_doctor)
    end
end
