Rails.application.routes.draw do
  #get 'payments/create'

  #get 'shopping_carts/show'

  resources :archives#, only: [:crate, :destroy, :new]
  resources :products
  devise_for :users
  
  authenticated :user do
    root 'home#index'
  end

  unauthenticated :user do
    devise_scope :user do
      root 'home#unregistered', as: :unregistered_root
    end
  end
  
  post '' => 'home#suscription'

  resources :in_shopping_carts, only: [:create, :destroy]
  get '/carrito' => 'shopping_carts#show'
  get '/carrito/:id' => 'shopping_carts#show', as: 'estado'
  post '/pagar' => 'payments#create'
  get '/payment/execute' => 'payments#execute'
end
