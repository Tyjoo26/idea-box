Rails.application.routes.draw do

  root 'welcome#index'

  get  '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  resources :users, only: [:new, :create, :show] do
    resources :ideas, only: [:show, :new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:new, :create, :show] do
    resources :categories, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :categories
end
