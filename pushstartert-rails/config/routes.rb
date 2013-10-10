PushstartertRails::Application.routes.draw do
  resources :projects

  devise_for :users

  resources :users
  root :to => "home#index"

  patch '/projects/:id/backup/:value', to: 'projects#backup', as: 'project_backup'
end
