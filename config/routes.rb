SimpleMusicDb::Application.routes.draw do
  root :to => 'users#index'
  resources :users do
    resources :albums do
      collection do
        post 'search'
      end
    end
  end
  resource :user_session
end
