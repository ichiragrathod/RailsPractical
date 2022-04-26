Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles
      resources :comments
      get 'article_search', to: 'articles#article_search'
      get 'comment_search', to: 'comments#comment_search'
    end
  end
end
