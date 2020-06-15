Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

#  mount API::Base, at: "/"
  mount API => '/'

  
#  resources :logs
#  namespace :api do
#	  namespace :v1 do
# 	    resources :logs, only: [:create]
#	end
#   end

  get 'welcome/index'
  root 'welcome#index'
end
