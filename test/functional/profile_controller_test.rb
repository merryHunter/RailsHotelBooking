require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get book" do
    get :book
    assert_response :success
  end

end
