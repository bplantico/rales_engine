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
      end

      namespace :items do
        get '/:id/best_day', to: 'best_day#show'
        get 'most_items', to: 'most_items#index'
      end

    end
  end

end

# /api/v1/items/most_items?quantity=#{group_size_one}"
