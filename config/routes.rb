Wiki::Application.routes.draw do
  
  devise_for :users, :controllers => { :registrations => "registrations" } do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end

  root :to => 'home#index'
  resources :pages
  resources :versions
  get '/sidebar/pages' => 'pages#sidebar_pages'
end
