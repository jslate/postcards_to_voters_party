class ApplicationController < ActionController::Base
  def authenticated_as(key)
    session[:authenticated_as] == key.to_s
  end

  def check_user_authentication
    redirect_to root_path unless authenticated_as(:admin) || authenticated_as(:user)
  end

  def check_admin_authentication
    redirect_to root_path unless authenticated_as(:admin)
  end
end
