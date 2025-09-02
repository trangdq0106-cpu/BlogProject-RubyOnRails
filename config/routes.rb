Rails.application.routes.draw do
  root 'top#index'
  get  '/blogs/:blog_id/comments', to: 'comments#show'
  resources :blogs do
    resources :comments
  end 

  namespace :venblog do
    resources :blogs #, only: [:index]
  end

end

