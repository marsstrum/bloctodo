Bloctodo::Application.routes.draw do

  resources :todos

  devise_for :users
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
