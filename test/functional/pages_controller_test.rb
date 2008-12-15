require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  context "with an existing page" do
    setup{@page = Factory(:page)}
    
    context "on GET to show" do
      setup{get :show, :id => @page.permalink}
  
      should_respond_with :success
      should_render_template :show
      should_assign_to :page, :equal => '@page'
    end
  end
  
  context "when authorised" do
    setup{@request.session[:admin] = true}
    
    context "on GET to edit" do
      setup{get :edit, :id => 'services'}
  
      should_respond_with :success
      should_render_template :edit
      should_assign_to :page, :class => Page
      should "have permalink of services" do
        assert_equal assigns(:page).permalink, 'services'
      end
    end
    
    context "on PUT to update" do
      setup{put :update, :id => 'services', :page => Factory.attributes_for(:page)}
  
      should_respond_with :redirect
      should_redirect_to '@page'
      should_assign_to :page, :class => Page
      should_change 'Page.count', :by => 1
    end
    
    context "with an existing page" do
      setup{@page = Factory(:page)}
      
      context "on GET to edit" do
        setup{get :edit, :id => @page.id}
    
        should_respond_with :success
        should_render_template :edit
        should_assign_to :page, :equal => '@page'
      end
      
      context "on PUT to update" do
        setup{put :update, :id => @page.id, :page => Factory.attributes_for(:page)}
    
        should_respond_with :redirect
        should_redirect_to '@page'
        should_assign_to :page, :equal => '@page'
      end
    end
  end
  
  should_route :get, '/services', :controller => 'pages', :action => 'show', :id => 'services'
  should_route :get, '/about', :controller => 'pages', :action => 'show', :id => 'about'
end
