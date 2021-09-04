Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :tasks, except: [:index]
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
  get '/page-not-found', action: :error404, controller: 'landing_page'

  root to: 'landing_page#index'
  get "/users/password" => 'landing_page#error404'
  get "*path" => 'landing_page#error404'
end
