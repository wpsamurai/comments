Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: :index do
    resources :posts, only: :index do
      resources :comments, only: :index
    end
  end

  resources :jobs, only: %i[index show create]

  delete :reset, to: 'reset#destroy'

  root 'jobs#index'
end
