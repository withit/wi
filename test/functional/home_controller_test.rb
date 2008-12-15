require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  context "on get to index" do
    setup{get :index}
    should_respond_with :success
    should_render_template :index
  end
  
  should_route :get, '/', :action => 'index', :controller => 'home'
end
