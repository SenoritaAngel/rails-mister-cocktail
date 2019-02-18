Rails.application.routes.draw do
  root to: 'cocktails#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :create, :index] do
    resources :doses, only: [:create]
  end
    resources :doses, only: [:destroy]
end
