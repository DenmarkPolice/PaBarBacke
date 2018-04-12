class ItemsController < ApplicationController
  helper_method :bags, :add, :rm

  def index
    if session[:user_id] != nil
      render :items_logged
    else
      redirect_to('/')
    end
  end

  def bags
    @user = User.find_by_id(session[:user_id])
    return @user.bags.round(0)
  end

  def add
    @user = User.find_by_id(session[:user_id])
    @user.increment(:bags, 1)
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
