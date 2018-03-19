class HomeController < ApplicationController
  def index
    
    
  end
  
  def unregistered
  end

  def suscription
    if params
      @email = MyEmail.create(email: params['email'])
      if @email.save
        render json: @email
      else
        render json: @email.errors, status: :unprocessable_entity
      end
    end
  end
end
