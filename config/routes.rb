ActionController::Routing::Routes.draw do |map|
  map.resources :twitter_users

  # The priority is based upon order of creation: first created -> highest priority.
  #map.home '/', :controller => 'home', :action => 'index'
  map.resource :session, :only => [:create, :destroy]
  map.login 'login', :controller => 'sessions', :action => 'new'
  map.portfolio '/portfolio', :controller => 'projects', :action => 'index'
  map.resources :projects
  map.projects '/websites', :controller => 'projects'
  map.resources :news, :singular => 'news_item'
  map.services 'services', :controller => 'pages', :action => 'show', :id => 'services'
  map.about 'about', :controller => 'pages', :action => 'show', :id => 'about'
  map.home '/', :controller => 'home', :action => 'index'
  map.connect '/index.html', :controller => 'home', :action => 'index'
  map.resources :pages
  map.connect '/contact_us.html', :controller => 'enquiries', :action => 'new'
  map.contact_us '/contact_us', :controller => 'enquiries', :action => 'new'
  map.connect '/company.html', :controller => 'pages', :action => 'company'
  map.connect '/process.html', :controller => 'pages', :action => 'processes'
  map.connect '/services.html', :controller => 'pages', :action => 'services'
  map.connect '/who_we_helped', :controller => 'projects', :action => 'helped'
  map.connect '/why_choose_us.html', :controller => 'pages', :action => 'why_choose_us'
  map.resource :enquiry, :only => [:create, :show]
  map.dashboard '/dashboard', :controller => 'dashboard'
  map.resources :assets
  map.resources :previews
  map.resources :banners

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
