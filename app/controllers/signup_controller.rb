class SignupController < ApplicationController

  def index
    render :signup
  end

  def new
      @user = User.new
    end
end
