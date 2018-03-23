class UsersController < ApplicationController

  def create
    @user = User.new(params.require(:user).permit(:förnamn,:efternamn,:mail))
    @user.password = BCrypt::Password.create(params[:user][:password])
    @user.save
    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def signups_params
      params.require(:user).permit(:förnamn,:efternamn,:mail,:password)
    end

end
