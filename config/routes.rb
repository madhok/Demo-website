Jobportal::Application.routes.draw do

  resources  :users
  resources :employers
  resources :sessions, only: [:new, :create, :destroy]


  root to: 'users#home'
  match '/create', to: 'users#new'
  match '/edit', to: 'users#edit'
  match '/show', to: 'users#show'
  match '/home', to: 'users#home'
  match '/say_when' , to: 'users#say_when'


  match '/employersignin', to:'sessions#employersignin'
 match  '/employershome', to: 'employers#show'
match '/employercreate', to: 'employers#new'

  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/employersigncreate', to:'sessions#employercreate'
  match '/interviewers', to:'users#interviewers'
  match  '/addinterviewee', to: 'employers#add_as_interviewee'
  match '/interviewees' ,  to: 'employers#interviewees'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/_index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
