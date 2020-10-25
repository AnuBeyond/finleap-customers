Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root to: 'customers#index'

    resources :customers, only: :index

    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        get 'filter_customer' => 'customers#index'
      end
    end
  end
end
