class WelcomeController < ApplicationController
  def main
  end

  def authenticate
    if (params[:pass] == 'flipitgood')
      session[:authenticated] = true
      redirect_to next_addresses_path
    else
      redirect_to root_path, alert: "Invalid password"
    end
  end

  def logout
    session[:authenticated] = nil
    redirect_to root_path
  end
end
