Spree::Core::Engine.routes.draw do
  namespace :admin do
    # get 'jirafe_settings', to: "jirafe_settings#edit", as: :jirafe_settings
    # post 'jirafe_settings', to: "jirafe_settings#update"
    resource :jirafe_settings, only: [:edit, :update]
  end
end
