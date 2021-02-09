Rails.application.routes.draw do
  get 'original_ideas/index'
  get 'original_ideas/show'
  root 'generations#index'
  devise_for :users, controllers: { registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    sessions: "users/sessions",
    omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :ideas
  resources :generations, only: [:index] do
    collection do
      get :generate
    end
  end
  resources :original_ideas, only: [:index, :show, :create, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
