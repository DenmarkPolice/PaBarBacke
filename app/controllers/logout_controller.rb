class LogoutController < ApplicationController

  def logout
    reset_session
    redirect_to '/'
  end
  
end
