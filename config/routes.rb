Rails.application.routes.draw do

  root 'welcome#index'

  get  '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get   '/logout', to: "sessions#destroy"

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :categories
  end
end
