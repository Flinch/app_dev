Rails.application.routes.draw do
  root "pages#start"
  get 'about', to: "pages#about"
end
