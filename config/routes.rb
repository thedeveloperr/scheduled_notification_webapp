Rails.application.routes.draw do
  get 'welcome/index'
  resources :broadcast_lists, only: [:new, :index, :show, :create] do
    resources :messages, only: [:index, :create]
  end

  root 'welcome#index'
end
