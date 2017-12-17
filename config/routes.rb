Rails.application.routes.draw do

  root 'ideas#root'

  resources :ideas
end
