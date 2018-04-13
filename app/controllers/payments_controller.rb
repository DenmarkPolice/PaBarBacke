class PaymentsController < ApplicationController


  def index
    if flash[:purchase] == nil
      if session[:user_id] != nil
        render :new_logged
      else
        render :new
      end
    else
      render :thanks
    end
  end

  def new
  end

  def create
    @purchase = Purchase.new
    if session[:user_id] == nil
      @purchase.mail = params[:mail]
    end
    @purchase.address = params[:address_line1]
    @purchase.city = params[:address_city]
    @purchase.zip = params[:address_zip]
    @purchase.id_token = params[:token]
    @purchase.save

    token = params[:token]

    charge = Stripe::Charge.create({
      amount: 8000,
      currency: 'sek',
      description: 'På Bar Backe Påse',
      source: token,
      metadata: {'order_id' => 6735},
    })
    flash[:purchase] = "Complete"
    redirect_to '/thankyou'
  end
end
