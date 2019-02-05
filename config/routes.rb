Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

  # resources :volounteers, only: [:index, :create, :destroy, :update, :show]
  # resources :events, only: [:index, :create, :destroy, :update, :show]
  resources :events
  resources :groups,  only: [:index, :create, :destroy, :update, :show]

    # resources :volounteers, only: [:index, :destroy, :update, :show]
    resources :volounteers, only: :create do
    collection do
      post 'confirm'
      post 'login'
    end
end
resources :volounteers, only: [:index, :create, :destroy, :update, :show]
  end
end

end

#
