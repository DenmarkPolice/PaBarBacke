class ItemsController < ApplicationController
  helper_method :bags, :add, :rm

  def index
    render :items_logged
  end

  def bags
    @user = User.find_by_id(session[:user_id])
    p @user
    return @user.bags.round(0)
  end

  def add
    p session[:user_id]
    @user = User.find_by_id(session[:user_id])
    @user.increment(:bags, 1)
    p @user
    @user.save
    redirect_to items_path
  end

  def rm
    @user = User.find_by_id(session[:user_id])

    if @user.bags != 0
      @user.decrement(:bags, 1)
    end
    
    @user.save
    redirect_to items_path
  end

end
