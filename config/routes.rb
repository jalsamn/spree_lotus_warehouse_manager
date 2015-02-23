Spree::Core::Engine.routes.draw do
  
  namespace :admin do
    resources :vendors
    get 'assignvendor', :to => 'vendors#assignvendor'

  end

  # Add your extension routes here
end
