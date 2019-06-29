Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/most_items',   to: 'most_items#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/revenue',      to: 'revenue#index'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
      end

      resources :merchants, only: [:show, :index] do
      end
    end
  end


end

   # api_v1_merchants GET  /api/v1/merchants/:id/favorite_customer(.:format)  api/v1/merchants/favorite_customer#show
