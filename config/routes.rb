Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  resources :trucks
  resources :users
  root to: 'trucks#index'

  resources :trucks do
    member do
      put "like" => "trucks#like"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
