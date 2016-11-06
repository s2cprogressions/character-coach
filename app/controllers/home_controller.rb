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
    render locals: {
      emergency_contact_number: "18885555555",
      general_disclaimer: "Hi",
    }
  end

  def keys_to_success
  end
end
