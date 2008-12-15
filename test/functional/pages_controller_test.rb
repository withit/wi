require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  context "with an existing page" do
    setup{@page = Factory(:page)}
    
    context "on GET to show" do
      setup{get :show, :id => @page.id}
  
      should_respond_with :success
      should_render_template :show
      should_assign_to :page, :equal => '@page'
    end
  end
  
  context "when authorised" do
    setup{@request.session[:admin] = true}
    
    context "on GET to new" do
      setup{get :new}
    
      should_respond_with :success
      should_render_template :new
      should_assign_to :page, :class => Page
    end
    
    context "on POST to create" do
      setup{post :create, :page => Factory.attributes_for(:page)}
  
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
end
