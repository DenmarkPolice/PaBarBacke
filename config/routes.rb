Rails.application.routes.draw do

  get 'payments/new'

  get 'payments/thanks'

  resources :signup, :users, :items, :charges
  root 'home#index'
  post 'items/add', to:'items#add'
  post 'items/rm', to:'items#rm'
  get '/logout', to:'logout#logout'
  post '/login', to:'login#create'
  get '/login', to:'login#index'
  get '/checkout', to:'checkout#index'

  post '/pay', to:'payments#create'

  resources :payments, only: [:new, :create]
  get 'payment-thanks', to: 'payments#thanks', as: 'payment_thanks'
  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  resources :posts
  root to: 'posts#index'
end
