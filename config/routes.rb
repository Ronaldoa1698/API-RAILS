Rails.application.routes.draw do

  get '/apidocs', to: 'apidocs#index'
  get '/swagger', to: 'swagger#index'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
    end
  end


end
