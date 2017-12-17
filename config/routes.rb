Rails.application.routes.draw do

  root 'ideas#root'

  resources :categories do
    resources :ideas
  end

end
