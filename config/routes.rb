Rails.application.routes.draw do

  get 'events_approval/index'
  get 'events_approval/' => 'events_approval#index'
  post 'events/:id/approve' => 'events#approve', as: "approve_event"
  post 'events/:id/decline' => 'events#decline', as: "decline_event"
  get 'rooms/list'
  get 'rooms/:id/details' => 'rooms#details'
  post 'rooms/list'
  post 'rooms/:id' => 'rooms#details'

  devise_for :users

  resources :rooms

  resources :tasks

  resources :bookings

  resources :equipment

  resources :events

  resources :event_templates, :path => "templates"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  root 'events#index'
  get 'templates/:id/new_event' => 'event_templates#new_event', as: :new_event_from_template 
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
