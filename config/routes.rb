Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

  # resources :volounteers, only: [:index, :create, :destroy, :update, :show]
  # resources :events, only: [:index, :create, :destroy, :update, :show]
  resources :groups  do
    resources :volounteers, only: [:index, :create, :destroy, :update, :show]
    end

    resources :volounteers, only: [:index, :create, :destroy, :update, :show]
  end
end

end

#
