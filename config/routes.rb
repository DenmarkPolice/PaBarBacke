Rails.application.routes.draw do

  resources :signup, :users, :items, :charges
  root 'home#index'
  post 'items/add', to:'items#add'
  post 'items/rm', to:'items#rm'
  get '/logout', to:'logout#logout'
  post '/login', to:'login#create'
  get '/login', to:'login#index'
  get '/checkout', to:'checkout#index'
end
