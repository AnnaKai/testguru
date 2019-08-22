Rails.application.routes.draw do

  root 'tests#index'

  resources :home, only: [:index, :new, :create]

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
      resources :gists, only: :index
      resources :tests do
        patch :update_inline, on: :member

        resources :questions, shallow: true, except: :index do
          resources :answers, shallow: true, except: :index
        end
      end
    end

  end

end
