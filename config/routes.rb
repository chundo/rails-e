Rails.application.routes.draw do
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
end
