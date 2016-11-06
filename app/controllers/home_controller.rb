class HomeController < ApplicationController
  def index
  end

  def app_entry_point
    session[:mobile_app] = true
    redirect_to root_path
  end

  def about
  end

  def help
  end

  def keys_to_success
  end
end
