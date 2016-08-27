Rails.application.routes.draw do

	devise_for :users, :controllers => { registrations: 'registration' }
	get 'dashboard/index'
	resources :rooms, only: [:new, :create, :show, :index, :destroy]
	resources :messages
	resources :avatars, only: [:new, :create, :show, :index, :destroy, :edit]

	root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"

end
