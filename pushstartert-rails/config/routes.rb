PushstartertRails::Application.routes.draw do
  resources :projects do
    member do
      patch 'backup'
      patch 'unfreeze'
    end
    collection do
      get 'funded'
    end
  end

  devise_for :users, controllers: { registrations: "registrations" }

  root to: "home#index"

end
