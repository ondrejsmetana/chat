Rails.application.routes.draw do

	devise_for :users, :controllers => { registrations: 'registration' }
	get 'dashboard/index'
	resources :rooms, only: [:new, :create, :show, :index, :destroy]
	resources :messages
	resources :admin , only: [:index]

	namespace :admin do
		resources :avatars, only: [:new, :create, :update, :show, :index, :destroy, :edit]
	end
	

	#require 'sidekiq/web'
	#mount Sidekiq::Web => '/sidekiq'
	root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"

end
