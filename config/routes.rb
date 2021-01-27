Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :users, only: [:index, :show]

  namespace :mypage do
    root to: "home#index"
    resources :notes, expect: [:show]
    resource :avatars, only: [:edit, :update]
  end

  resources :notes, only: [:index, :show] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
