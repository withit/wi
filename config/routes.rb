ActionController::Routing::Routes.draw do |map|
  map.resources :posts, :has_many => :comments
  map.resources :comments
  map.resources :subscriptions
  map.enquiries 'contact-us', :controller => 'enquiries', :action => 'new', :conditions => {:method => :get}
  map.enquiries 'contact-us', :controller => 'enquiries', :action => 'create', :conditions => {:method => :post}
  map.resources :tags
  # The priority is based upon order of creation: first created -> highest priority.
  #map.home '/', :controller => 'home', :action => 'index'

  map.login 'login', :controller => 'sessions', :action => 'new'  
  map.resource :session, :only => [:create, :destroy]
  map.resources :twitter_users
  map.resources :services
  map.projects '/projects', :controller => "pages", :action => "projects"
  map.why_choose_us '/company/why-choose-us', :controller => 'pages', :action => 'why_choose_us'
  map.root :controller  => 'home', :action => 'index'
  map.home '/', :controller => 'home', :action => 'index'  
  map.services '/services', :controller => 'pages', :action => 'show', :id => 'services'
  map.connect '/services.html', :controller => 'pages', :action => 'show', :id => 'services'
  map.subscribe '/subscribe', :controller => 'pages', :action => 'subscribe'
  map.about '/about', :controller => 'pages', :action => 'show', :id => 'about'
  map.connect '/about.html', :controller => 'pages', :action => 'show', :id => 'about'

  map.connect '/index', :controller => 'home', :action => 'index'
  map.connect '/index.html', :controller => 'home', :action => 'index'

  map.contact_us '/contact_us', :controller => 'enquiries', :action => 'new'
  map.connect '/contact_us.html', :controller => 'enquiries', :action => 'new'
    
  map.connect '/company', :controller => 'pages', :action => 'company'
  map.connect '/company.html', :controller => 'pages', :action => 'company'

  map.connect '/services', :controller => 'pages', :action => 'services'
  map.connect '/services.html', :controller => 'pages', :action => 'services'

  map.connect '/who_we_helped', :controller => 'projects', :action => 'helped'
  map.connect '/who_we_helped.html', :controller => 'projects', :action => 'helped'

  map.connect '/why_choose_us', :controller => 'pages', :action => 'why_choose_us'
  map.connect '/why_choose_us.html', :controller => 'pages', :action => 'why_choose_us'
          
  map.resources :projects, :as => 'websites'
  map.portfolio '/portfolio', :controller => 'projects', :action => 'index'  
  map.resources :news_letters, :as => 'email-campaigns'
  map.resources :banners, :path_prefix => 'projects'
                      
  map.resources :news, :singular => 'news_item'
  map.news_by_month 'news/:year/:month', :controller => 'news', :action => 'index'
  map.news_item_by_month 'news/:year/:month/:id', :controller => 'news', :action => 'show'

  map.resource :enquiry, :only => [:create, :show]

  map.resources :pages, :member => {:move_up => :put, :move_down => :put}

  map.resources :assets
  map.resources :previews
  map.resources :websites, :path_prefix => 'projects'
  map.resources :newsletters, :path_prefix => 'projects'
  map.dashboard '/dashboard', :controller => 'dashboard'
  map.connect '/javascripts/:action.js', :controller => 'javascripts'
  map.clients '/who-weve-helped', :action => 'index', :controller => 'clients'
  map.company '/company', :action => 'index', :controller => 'pages'
  map.case_study '/case-study', :action => 'show', :controller => 'case_studies'
  map.blogs '/blogs', :action => 'index', :controller => 'posts'
  
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
