Rails.application.routes.draw do
  root "pages#start"
  get 'about', to: "pages#about"
  resources :articles
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  
end
