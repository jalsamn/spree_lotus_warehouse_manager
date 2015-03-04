Spree::Core::Engine.routes.draw do
  
  namespace :admin do
    resources :vendors
    resources :temp_po_items
    get 'assignvendor', :to => 'vendors#assignvendor'
    get 'updatevendor', :to => 'vendors#updatevendor', :as => :update_vendor
    post 'add_individual_products_1', :to => 'purchase_orders#add_individual_products_1'
    
    resources :purchase_orders
    get 'listproducts', :to => 'purchase_orders#listproducts'
    post 'add_individual_products', :to => 'purchase_orders#add_individual_products'
    post 'update_individual_products', :to => 'purchase_orders#update_individual_products'
    get 'display_detailed_purchase_order', :to => 'purchase_orders#display_detailed_purchase_order'
    
  end

  # Add your extension routes here
end
