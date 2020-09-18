Rails.application.routes.draw do
  devise_for :admins
  get 'home/index'

  namespace :admin do
    resources :products
  end

  root 'home#index'
end
