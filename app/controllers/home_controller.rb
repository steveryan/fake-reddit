class HomeController < ApplicationController

  def show
    if user_signed_in?
      @current_user = current_user.email
    else
      @current_user = "YOU ARE NOT SIGNED IN"
    end
  end

end
