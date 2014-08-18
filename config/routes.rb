AcmApp::Application.routes.draw do

 

  # Resources
  resources :users do
    member do
      put "toggle_admin"
    end
  end
  resources :icpc_entries
  resources :projects
  
  resources :acm_projects, path: "showcase" do
    member do
      get "approve" # /showcase/:id/approve
    end
    collection do
      get "submissions" # /showcase/submissions
    end
  end

  # Calendar Proxy
  get "/calendar/upcoming.json", to: "calendar_proxy#upcoming"
  get "/calendar/recent.json", to: "calendar_proxy#recent"

  # Authentication
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  post "/auth/failure", to: "pages#invalid_request"
  get "/signout", to: "sessions#destroy", as: "signout"

  # Pages
  root "pages#home"
  get "/invalid_request", to: 'pages#invalid_request'
  get "/calendar", to: "pages#calendar"
  get "/subscribe", to: "pages#subscribe"
  get "/admin", to: "pages#admin"

  # Officers
  get "/officers", to: "officers#officers_2014"
  get "/officers_index", to: "officers#officers_index"
  get "/officers_2014", to: "officers#officers_2014"
  get "/officers_2013", to: "officers#officers_2013"
  
  #tagging
  get "tags/:tag", to: "projects#index", as: :tag

  # External links
  get "/portfolio" => redirect("https://portfolio.wustl.edu/organization/acm"), as: :portfolio
  get "/twitter" => redirect("https://twitter.com/WashUACM"), as: :twitter
  get "/validator" => redirect("http://validator.w3.org/check?uri=https%3A%2F%2Facm.wustl.edu"), as: :validator

  # Error pages
  get "/404", :to => "pages#not_found"

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
