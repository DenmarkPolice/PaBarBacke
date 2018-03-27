Rails.application.routes.draw do

  resources :signup, :users, :items
  root 'home#index'
  post 'items/add', to:'items#add'
  post 'items/rm', to:'items#rm'
  post '/logout', to:'logout#logout'
  post '/login', to:'login#create'
  get '/login', to:'login#index'
end
