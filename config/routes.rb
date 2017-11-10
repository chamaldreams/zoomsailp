Rails.application.routes.draw do
  devise_for :users
  root to:'home#index'	
  get 'home/index'

  get 'home/admin'

  get 'home/customer'

  get 'home/dealer'

  get 'home/production'

  get 'home/guest'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
