require 'test_helper'

class EnquiriesControllerTest < ActionController::TestCase

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enquiry" do
    assert_difference('Enquiry.count') do
      post :create, :enquiry => enquiries(:one).attributes
    end

    assert_redirected_to enquiry_path(assigns(:enquiry))
  end
end
