Rails.application.routes.draw do

  resources :items
  devise_for :users
  # scope is a keyword CMD
  # "api" is the URL name. It can be any name you want to call it
  # defaults: {format: "json"} do --> this CMD tells the ruby to change its default to JSON format
  # rsources :item references the controller that is being targeted
  scope "api", defaults: {format: "json"} do 
    resources :items
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'welcome#index'

  get '/users/:id', to: 'users#show', as: :user_profile  
  get '/users/:id/edit_profile', to: 'users#edit', as: :edit_profile, :as => :user
  put '/users/:id/edit_profile', to: 'users#update' 
  patch '/users/:id/edit_profile', to: 'users#update'

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
