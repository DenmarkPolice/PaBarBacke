class ChargesController < ApplicationController
  require 'stripe'

  def index
    render :new
  end

  def new
  end

  def create
    # Amount in cents
    @user = User.find_by_id(session[:user_id])
    @amount = 8000 * @user.bags
    @amount = @amount.to_i
    @amount_show = 80 * @user.bags

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'På Bar Backe Påsar',
      :currency    => 'SEK'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
