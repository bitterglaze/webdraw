Rails.application.routes.draw do
  resources :tips
  resources :steps
  resources :players
  namespace :api, format: :json do
    resources :drawroom do
      collection do
        get 'index'
        post 'sync'
      end
    end

  end

  mount ActionCable.server => '/cable'

  get 'drawroom/index'
  get 'welcome/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
