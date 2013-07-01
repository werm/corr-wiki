Wiki::Application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "registrations" } do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  resources :pages  
  get '/sidebar/pages' => 'pages#sidebar_pages'

  root :to => 'home#index'
end
