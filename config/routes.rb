Rails.application.routes.draw do

  root 'tests#index'

  get 'sign-up', to: 'users#new'
  get 'logout', to: 'sessions#destroy'
  get 'sign-in', to: 'sessions#new'

  resources :sessions, only: :create
  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  # GET /test_passages/101/result
  resources :test_passages, only: [:show, :update] do
    member do
      get :result
    end
  end

end
