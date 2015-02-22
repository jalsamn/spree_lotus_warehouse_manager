Spree::Core::Engine.routes.draw do
  
  namespace :admin do
    resources :vendors
  end

  # Add your extension routes here
end
