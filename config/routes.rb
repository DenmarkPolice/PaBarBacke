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
  get '/thankyou', to:'payments#index'
  resources :payments, only: [:index, :new, :create]
  resources :charges, only: [:new, :create]
  resources :posts
  root to: 'posts#index'

  get '/vision', to:'vision#index'
end
