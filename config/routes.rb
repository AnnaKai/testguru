Rails.application.routes.draw do

  root 'tests#index'

  scope "(/:lang)", lang: /en|ru/ do

    devise_for :users, skip: :omniauth_callbacks

    resources :tests, only: :index do
      member do
        post :start
      end
    end

  # GET /test_passages/101/result
    resources :test_passages, only: [:show, :update] do
      member do
        get :result
        post :gist
      end
    end

    namespace :admin do
      resources :tests do
        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end
    end

  end

end
