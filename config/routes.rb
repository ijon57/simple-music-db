SimpleMusicDb::Application.routes.draw do
  root :to => 'users#index'
  resources :users do
    resources :albums do
#      resources :titles
    end
  end
  resource :user_session
end
