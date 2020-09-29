Rails.application.routes.draw do
  devise_for :admins
  get 'home/index'
  get 'shop',to: 'shop#index', as: 'shop'
  get 'shop/:name',to: 'shop#show', as: 'shop_show'

  namespace :admin do
    resources :products
    resources :product_sizes
    resources :product_quantities
    resources :product_types
    resources :blogs
  end

  root 'home#index'
end
