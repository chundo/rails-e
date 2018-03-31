class ShoppingCartsController < ApplicationController
  include PayPal::SDK::REST
  def show
    if params[:id]
      @payment = Payment.find(params[:id])
    end
  end
end
