class DashboardController < ApplicationController
  include Secured

  def index
    @user = session[:userinfo].symbolize_keys
  end
end
