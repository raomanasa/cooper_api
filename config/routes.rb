Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth', skip: [:omniauth_callbacks]
  namespace :api do
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
    end
    namespace :v1 ,defaults: { format: :json } do
      resources :performance_data, only: [:create, :index] 
    end
  end
end
