require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  context "on GET to :index" do
    setup{get :index}
    
    should_respond_with :success
    should_assign_to :news
  end
  
  context "on GET to :index with format :rss" do
    setup{get :index, :format => 'rss'}
    
    should_respond_with :success
    should_assign_to :news
  end
  
  context "when logged in as admin" do
    setup{@request.session[:admin] = true}
    context "on GET to :new" do
      setup{get :new}
    
      should_respond_with :success
      should_assign_to :news, :class => News
    end
  
    context "on POST to :create" do
      setup{post :create, :news => Factory.attributes_for(:news)}
    
      should_respond_with :redirect
      should_assign_to :news
      should_change 'News.count', :by => 1
    end
  
    context "with an existing news item" do
      setup{@news = Factory(:news)}
    
      context "on GET to :edit" do
        setup{get :edit, :id => @news.id}
      
        should_respond_with :success
        should_assign_to :news, :equal => '@news'
      end
    
      context "on PUT to :update" do
        setup{put :update, :id => @news.id}
      
        should_respond_with :redirect
        should_assign_to :news, :equal => '@news'
      end
    
      context "on DELETE to :destroy" do
        setup{delete :destroy, :id => @news.id}
      
        should_respond_with :redirect
        should_assign_to :news, :equal => '@news'
        should_change 'News.count', :by => -1
      end
    end
  end
end
