Rails.application.routes.draw do
  devise_for :users
  resources :registered_applications do
    resources :events
  end
  root to:"welcome#index"
end
