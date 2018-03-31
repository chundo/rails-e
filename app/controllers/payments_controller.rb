class PaymentsController < ApplicationController
  
  include PayPal::SDK::REST

  def create
    # Build Payment object
    @payment = Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },
      :redirect_urls => {
        :return_url => "http://localhost:3000/payment/execute",
        :cancel_url => "http://localhost:3000/carrito" },
      :transactions =>  [{
        :item_list => {
          :items => [{
            :name => "item",
            :sku => "item",
            :price => "5",
            :currency => "USD",
            :quantity => 1 }]},
        :amount =>  {
          :total =>  "5",
          :currency =>  "USD" },
        :description =>  "This is the payment transaction description." }]})

    if @payment.create
      @payment.id     # Payment Id
      @my_payment = MyPayment.new(paypal_id: @payment.id)
      
      redirect_to  @payment.links.find{|v| v.method == "REDIRECT"}.href
    else
      @payment.error  # Error Hash
    end
  end

  def execute
    payment = Payment.find(params[:paymentId])

    if payment.execute( :payer_id => params[:PayerID] )
      # Success Message
      # Note that you'll need to `Payment.find` the payment again to access user info like shipping address
      @payment = Payment.find(params[:paymentId])
      redirect_to estado_path(@payment.id), notice: "Pago efectivo"
    else
      payment.error # Error Hash
      redirect_to carrito_path, notice: "Pago No"
    end

  end

  
end
