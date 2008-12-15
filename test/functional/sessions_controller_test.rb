require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  context "on GET to new" do
    setup{get :new}
    should_render_template :new
    should_respond_with :success
  end
  
  context "on POST to create" do
    context "with valid password" do
      setup{post :create, :password => 'twisties'}
      should_respond_with :redirect
      should_redirect_to 'home_path'
      should "set admin in the session" do
        assert @request.session[:admin]
      end
    end
    
    context "with invalid password" do
      setup{post :create, :password => 'smarties'}
      should_respond_with :success
      should_render_template :new
      should_set_the_flash_to "Invalid Password"
      should "not set admin in the session" do
        assert !@request.session[:admin]
      end
    end
  end
  
  context "on DELETE to destroy" do
    setup{@request.session[:admin]= true; delete :destroy}
    should_respond_with :redirect
    should_redirect_to 'home_path'
    should "set remove admin in the session" do
      assert !@request.session[:admin]
    end
  end
  
  should_route :get, '/login', :action => :new
end
