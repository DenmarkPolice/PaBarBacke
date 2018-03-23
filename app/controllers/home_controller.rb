class HomeController < ApplicationController
helper_method :count_db

  def index
    render :home
  end

  def count_db
    @count_db = User.distinct.count('id')
    return @count_db
  end

end
