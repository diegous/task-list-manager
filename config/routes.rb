Rails.application.routes.draw do
  resources :lists

  resources :lists do
    resources :tasks
  end
end
