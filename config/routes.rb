Rails.application.routes.draw do
  resources :tips
  resources :steps
  resources :players

  namespace :api, format: :json do
    resources :drawroom do
    # patch 'drawrooms' => 'drawrooms#update'
      collection do

        get 'index'
        # patch 'update'
        post 'sync'
      end
    end

  end

  mount ActionCable.server => '/cable'
#
# post 'drawroom', action: :create, controller: 'drawroom'
# # get 'drawroom', action: :show, controller: 'drawroom'

resources :drawroom



  # get 'drawroom/index'
  # get 'welcome/index'

  # post 'welcome/index'
  get 'welcome/index'
  # post 'welcome/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
