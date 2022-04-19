class ApplicationController < ActionController::Base
  def require_admin
    if !user_signed_in? || !current_user.admin?
      flash[:alert]="Only admin can perform that action!"
      redirect_to root_path
    end
  end
end
