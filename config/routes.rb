Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :jirafe_settings, only: [:edit, :update]
  end
end
