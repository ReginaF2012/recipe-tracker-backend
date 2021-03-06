Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :recipes, only: [:show, :index, :create, :destroy, :update]
      post '/users/login', to: 'users#login'
      get '/users/autologin', to: 'users#autologin'
    end
  end

end
