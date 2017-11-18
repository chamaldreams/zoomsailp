Rails.application.routes.draw do
  

  root to:'home#index'

  devise_for :users, controllers: {
             
                   registrations: 'users/registrations',
                   }

  resources :users

  get 'home/admin' => "home#admin", as: :admin_home
  get 'home/production' => "home#production", as: :production_home


  get 'home/index'


  get 'home/customer'

  get 'home/dealer'

  get 'home/production'

  get 'home/guest'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
