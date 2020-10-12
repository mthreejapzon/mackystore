Rails.application.routes.draw do
  devise_for :admins
  get 'home/index'
  get 'shop',to: 'shop#index', as: 'shop'
  get 'blog',to: 'blog#index', as: 'blog'
  get 'shop/:name',to: 'shop#show', as: 'shop_show'
  get 'blog/:slug',to: 'blog#show', as: 'blog_show'
  get 'products/:id', to: 'products#show', as: 'product'

  namespace :admin do
    resources :products
    resources :product_sizes
    resources :product_quantities
    resources :product_types
    resources :blogs
  end

  root 'home#index'
end
