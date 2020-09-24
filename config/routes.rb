Rails.application.routes.draw do
  devise_for :admins
  get 'home/index'

  namespace :admin do
    resources :products
    resources :product_sizes
    resources :product_quantities
    resources :product_types
  end

  root 'home#index'
end
