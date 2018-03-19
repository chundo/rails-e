class HomeController < ApplicationController    
  protect_from_forgery with: :null_session, only: 'suscription'

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
