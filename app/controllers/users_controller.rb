class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
      flash[:notice] = "User details was Added successfully."
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    old_email = @user.email
    if @user.update(user_params)
      UserMailer.with(user: @user).update_email.deliver_now if old_email != @user.email
      flash[:notice] = "User updated successfully."
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.destroy
    redirect_to users_path
  end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params  
      params.require(:user).permit(:name,:email,:picture)
    end
end
