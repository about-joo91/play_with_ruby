Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  root :to => "home#index"
end
