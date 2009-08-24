require 'test_helper'

class NewsLettersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:news_letters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create news_letter" do
    assert_difference('NewsLetter.count') do
      post :create, :news_letter => { }
    end

    assert_redirected_to news_letter_path(assigns(:news_letter))
  end

  test "should show news_letter" do
    get :show, :id => news_letters(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => news_letters(:one).id
    assert_response :success
  end

  test "should update news_letter" do
    put :update, :id => news_letters(:one).id, :news_letter => { }
    assert_redirected_to news_letter_path(assigns(:news_letter))
  end

  test "should destroy news_letter" do
    assert_difference('NewsLetter.count', -1) do
      delete :destroy, :id => news_letters(:one).id
    end

    assert_redirected_to news_letters_path
  end
end
