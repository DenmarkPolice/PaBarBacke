class PaymentsController < ApplicationController
  def new
  end

  def create
    logger.info "*" * 80
    logger.info params
    logger.info "*" * 80

    token = params[:stripeToken]

charge = Stripe::Charge.create({
    amount: 8000,
    currency: 'sek',
    description: 'På Bar Backe Påse',
    source: token,
    metadata: {'order_id' => 6735},
})

  end
end
