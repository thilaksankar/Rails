Rails.application.routes.draw do
  root 'topics#index'
  get 'posts/index'
  resources :topics do
    resources :posts do
      resources :comments
      resources :ratings
    end
  end
  resources :tags
end
