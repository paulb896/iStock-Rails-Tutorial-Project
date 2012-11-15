IStockRailsTutorialProject::Application.routes.draw do
  root :to => "users#index"

  resources :users
  resources :user_sessions
  
  match 'login'  => 'user_sessions#new',     :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  match 'password_reset' => 'password_reset#index',	:as => :password_reset
  match 'password_reset_confirm' => 'password_reset_confirm#create',	:as => :password_reset_confirm
end
