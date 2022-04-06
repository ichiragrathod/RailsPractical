class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def new 
    @user = User.new
  end

  def show
    @events = @user.events
  end


  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information successfully updated."
      redirect_to events_path
    else
        render 'edit'
    end
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Events #{@user.username}, you have successfully signed up"
      redirect_to events_path
    else 
      render 'new'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
end
