Bloctodo::Application.routes.draw do

  resources :todos

  devise_for :users
  get "welcome/index"
  get "welcome/about"

  root to: 'welcome#index'
end
