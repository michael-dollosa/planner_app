Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :tasks, except: [:index]
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  root to: 'landing_page#index'
  get "*path" => 'landing_page#error404'
end
