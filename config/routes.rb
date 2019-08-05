Rails.application.routes.draw do
  require 'resque/server'
  mount Resque::Server, at: '/jobs'
  mount ResqueWeb::Engine => 'admin/resque_web'
  get 'welcome/index'
  resources :broadcast_lists, only: [:new, :index, :show, :create] do
    resources :messages, only: [:index, :create]
  end

  root 'welcome#index'
end
