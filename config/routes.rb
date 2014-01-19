AcmApp::Application.routes.draw do

  resources :users
  
  resources :projects do
    member do
      get 'interest' # /projects/:id/interest
    end
  end

  root 'pages#home'
  get "/invalid_request", to: 'pages#invalid_request'
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  post "/auth/failure", to: 'pages#invalid_request'
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get "/calendar", to: "pages#calendar"
  get "/officers", to: "pages#officers"

  # External links
  get "/portfolio" => redirect("https://portfolio.wustl.edu/organization/acm"), as: :portfolio
  get "/twitter" => redirect("https://twitter.com/WashUACM"), as: :twitter
  get "/validator" => redirect("http://validator.w3.org/check?uri=https%3A%2F%2Facm.wustl.edu"), as: :validator


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
