Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#show"
  resources :subreddits, only: [:index, :show], path: :r do
    resources :posts, only: :index
  end

  resources :users, only: [:index, :show], path: :u

end
