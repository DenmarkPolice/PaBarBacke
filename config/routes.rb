Rails.application.routes.draw do

  resources :signup, :login, :users
  root 'home#index'

end
