IStockRailsTutorialProject::Application.routes.draw do
  root :to => "users#index"

  resources :users
  resources :user_sessions
  
  match 'login'  => 'user_sessions#new',     :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
end
