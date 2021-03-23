Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
end