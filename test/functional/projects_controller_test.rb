require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def self.should_require_authorisation
    should_redirect_to 'home_path'
    should_set_the_flash_to 'Not Authorised'
    should_not_change 'Project.count'
    should_respond_with :redirect
  end
  
  context "on GET to new" do
    setup{get :new}
    
    should_require_authorisation
  end
  
  context "on GET to index" do
    setup{get :index}
    should_respond_with :success
    should_render_template :index
    should_assign_to 'projects'
  end

  context "on POST to create" do
    setup{post :create, :project => Factory.attributes_for(:project)}
    
    should_require_authorisation
  end

  context "with a project" do
    setup{@project = Factory(:project)}

    context "on GET to edit" do
      setup{get :edit, :id => @project.to_param}
    
      should_require_authorisation
    end
  
    context "on PUT to update" do
      setup{put :update, :id => @project.to_param, :project => Factory.attributes_for(:project)}
    
      should_require_authorisation
    end
  
    context "on DELETE to destroy" do
      setup{delete :destroy, :id => @project.to_param}
    
      should_require_authorisation
    end
  end

  context "with a project" do
    setup{@project = Factory(:project)}

    context "on GET to show" do
      setup{get :show, :id => @project.to_param}
    
      should_respond_with :success
      should_render_template :show
      should_assign_to "project", :equal => '@project'
    end
  end

  context "when logged in as admin" do
    setup{@request.session[:admin] = true}
    
    context "on GET to new" do
      setup{get :new}
      should_respond_with :success
      should_render_template :new
      should_assign_to 'project', :class => Project
    end
  
    context "on POST to create" do
      setup{post :create, :project => Factory.attributes_for(:project)}
      should_respond_with :redirect
      should_change 'Project.count'
      should_set_the_flash_to 'Project was successfully created'
      should_redirect_to 'projects_path'
    end
  
    context "with a project" do
      setup{@project = Factory(:project)}
  
      context "on GET to edit" do
        setup{get :edit, :id => @project.to_param}
      
        should_respond_with :success
        should_render_template :edit
        should_assign_to "project", :equal => '@project'
      end
    
      context "on PUT to update" do
        setup{put :update, :id => @project.to_param, :project => Factory.attributes_for(:project)}
      
        should_respond_with :redirect
        should_assign_to "project", :equal => '@project'
        should_redirect_to 'projects_path'
        should_set_the_flash_to 'Project was successfully updated'
      end
    
      context "on DELETE to destroy" do
        setup{delete :destroy, :id => @project.to_param}
        should_set_the_flash_to 'Project was successfully deleted'
        should_respond_with :redirect
        should_assign_to "project", :equal => '@project'
        should_redirect_to 'projects_path'
        should_change 'Project.count', :by => -1
      end
    end
  end
  
  should_route :get, '/portfolio', :action => 'index'
end
