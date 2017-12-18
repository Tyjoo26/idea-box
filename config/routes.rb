Rails.application.routes.draw do

  root 'welcome#index'

  resources :users, only: [:new, :create, :show]

  resources :categories do
    resources :ideas
  end

end
