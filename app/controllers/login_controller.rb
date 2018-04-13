class LoginController < ApplicationController
  def index
    render :login
  end

  def create
    @user = User.find_by_mail(params[:user][:mail])
    if @user != nil
      hashed_password = BCrypt::Password.new(@user.password)
      if hashed_password == params[:user][:password]
        session[:user_id] = @user.id
        User.find(session[:user_id])
        redirect_to "/"
      else
        flash[:error] = 'Invalid login credentials.'
        redirect_to '/'
      end
    else
      flash[:error] = 'Invalid login credentials.'
      redirect_to '/'
    end
  end
end
