class ApplicationController < ActionController::Base

  before_action :load_current_user
  before_action :require_logged_in

  def load_current_user
    if session[:userinfo].present?
      Current.user = User.find_by(email: session[:userinfo]['name'])
    end
  end

  def require_logged_in
    unless Current.user.present?
      flash.alert = "User account with this email not found. You must contact Jonathan to set you up."
      redirect_to '/'
    end
  end

  def require_admin
    unless Current.user.present? && Current.user.admin?
      flash.alert = "The page you tried to access is restricted to admins only."
      redirect_to dashboard_path
    end
  end
end
