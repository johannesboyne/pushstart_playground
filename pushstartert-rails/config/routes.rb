PushstartertRails::Application.routes.draw do
  resources :projects

  devise_for :users

  resources :users
  root :to => "home#index"
end
