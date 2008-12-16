require 'test_helper'

class EnquiriesControllerTest < ActionController::TestCase
  should_route :get, '/contact-us', :action => 'new'
  
  context "on GET to :new" do
    setup{get :new}
    
    should_render_template :new
    should_respond_with :success
    should_assign_to :enquiry, :class => Enquiry
  end
  
  context "on POST to :create" do
    setup{post :create, :enquiry => Factory.attributes_for(:enquiry)}
    
    should_respond_with :redirect
    should_assign_to :enquiry, :class => Enquiry
    should_change 'Enquiry.count', :by => 1
    should_return_from_session :enquiry_id, '@enquiry.id'
    should "send email" do
      assert_sent_email
    end 
  end
  
  context "with a enquiry_id " do 
    setup{@enquiry = Factory(:enquiry).id}
    
    context "saved in the session" do
      setup{@request.session[:enquiry_id] = @enquiry}
    
      context "on GET to :show" do
        setup{get :show}
        should_render_template :show
        should_return_from_session :enquiry_id, 'nil'
        should_assign_to :enquiry, :equal => '@enquiry'
        should_respond_with :success
      end
    end
  end
  
  context "without an enquiry id saved in the session on GET to :show" do
    setup{get :show}
    
    should_redirect_to 'contact_us_path'
    should_respond_with :redirect
  end
end
