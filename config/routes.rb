Rails.application.routes.draw do
  root "pages#start"
  get 'about', to: "pages#about"

  resources :articles, only: [:show, :index] 
end
