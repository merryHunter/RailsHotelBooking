require 'test_helper'

class ApartmentTypesControllerTest < ActionController::TestCase
  setup do
    @apartment_type = apartment_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apartment_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apartment_type" do
    assert_difference('ApartmentType.count') do
      post :create, apartment_type: { title: @apartment_type.title }
    end

    assert_redirected_to apartment_type_path(assigns(:apartment_type))
  end

  test "should show apartment_type" do
    get :show, id: @apartment_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apartment_type
    assert_response :success
  end

  test "should update apartment_type" do
    put :update, id: @apartment_type, apartment_type: { title: @apartment_type.title }
    assert_redirected_to apartment_type_path(assigns(:apartment_type))
  end

  test "should destroy apartment_type" do
    assert_difference('ApartmentType.count', -1) do
      delete :destroy, id: @apartment_type
    end

    assert_redirected_to apartment_types_path
  end
end
