IStockRailsTutorialProject::Application.routes.draw do
  resources :articles

  root :to => "users#index"

  resources :users
  resources :user_sessions

  match 'login'  => 'user_sessions#new',     :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout

  match 'password_reset' => 'password_reset#index',	:as => :password_reset
  match 'password_reset_confirm' => 'password_reset#create',	:as => :password_reset_confirm
  match 'password_reset_edit' => 'password_reset#edit',	:as => :password_reset_edit
  match 'password_reset_change' => 'password_reset#change',	:as => :password_reset_change
end
