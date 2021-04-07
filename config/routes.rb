Rails.application.routes.draw do
  devise_for :users
  root 'topics#index'
  get '/posts/index'
  get '/posts', to: 'posts#show_all'
  resources :topics do
    resources :posts do
      resources :comments
      resources :ratings
    end
  end
  resources :tags
  post '/:topic_id/post/:id/mark_read', to: 'posts#mark_post_read'
end
