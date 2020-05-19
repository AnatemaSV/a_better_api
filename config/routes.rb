# frozen_string_literal: true

Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :infocomplains, only: %i[index show] do
        collection do
          get :search
        end
      end
      resources :inforequests, only: %i[index show] do
        collection do
          get :search
        end
      end
      resources :institutions, only: %i[index show] do
        collection do
          get :search
        end
      end
      resources :catalogs, only: %i[index] do
        collection do
          get :institutions
          get :inforequest_results
          get :totals
          get :inforequests_history
        end
      end
    end
  end
end
