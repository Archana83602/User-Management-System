Rails.application.routes.draw do
  get 'users/index'
  resources :employees do
      member do
        patch 'update_status'
      end
    end
    


  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'employees#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  get 'home/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root "home#index"
end
