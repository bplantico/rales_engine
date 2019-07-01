Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/most_items',   to: 'most_items#index'
        get '/most_revenue', to: 'most_revenue#index'
        get '/revenue',      to: 'revenue#index'
        get '/:id/favorite_customer', to: 'favorite_customer#show'
        get '/:id/revenue', to: 'merchant_revenue#show'
        get '/:id/customers_with_pending_invoices', to: 'customers_with_pending_invoices#show'
      end
      resources :merchants, only: [:show, :index]

      namespace :customers do
        get '/:id/favorite_merchant', to: 'favorite_merchant#show'
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :customers, only: [:index, :show]

      namespace :items do
        get '/:id/best_day', to: 'best_day#show'
        get '/most_items',    to: 'most_items#index'
        get '/most_revenue',  to: 'most_revenue#index'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :invoice_items, only: [:index, :show]

      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
      end
      resources :invoices, only: [:index, :show]

      # "/api/v1/invoices/find_all?id=#{invoice_find_all['id']}"

    end
  end

end
