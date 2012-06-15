SimpleMusicDb::Application.routes.draw do
  root :to => 'users#index'
  resources :users
  resource :user_session
end
