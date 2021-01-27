Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :users, only: [:index, :show]

  namespace :mypage do
    root to: "home#index"
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
