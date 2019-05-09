Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#show"

  concern :has_posts do
    resources :posts, only: :show, path: :comments
  end

  resources :subreddits, only: [:index, :show], path: :r, concerns: :has_posts

  resources :users, only: [:index, :show], path: :u



end
