class WelcomeController < ApplicationController
  def main
  end

  def authenticate
    user = params[:pass] == ENV.fetch("USER_PW")
    admin = params[:pass] == ENV.fetch("ADMIN_PW")
    if user
      session[:authenticated_as] = :user
      redirect_to get_an_address_addresses_path
    elsif admin
      session[:authenticated_as] = :admin
      redirect_to campaigns_path
    else
      redirect_to root_path, alert: "Invalid password"
    end
  end

  def logout
    session[:authenticated] = nil
    redirect_to root_path
  end
end
