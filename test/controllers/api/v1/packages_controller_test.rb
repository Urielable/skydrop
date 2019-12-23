require 'test_helper'

class Api::V1::PackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_package = api_v1_packages(:one)
  end

  test "should get index" do
    get api_v1_packages_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_package_url
    assert_response :success
  end

  test "should create api_v1_package" do
    assert_difference('Api::V1::Package.count') do
      post api_v1_packages_url, params: { api_v1_package: {  } }
    end

    assert_redirected_to api_v1_package_url(Api::V1::Package.last)
  end

  test "should show api_v1_package" do
    get api_v1_package_url(@api_v1_package)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_package_url(@api_v1_package)
    assert_response :success
  end

  test "should update api_v1_package" do
    patch api_v1_package_url(@api_v1_package), params: { api_v1_package: {  } }
    assert_redirected_to api_v1_package_url(@api_v1_package)
  end

  test "should destroy api_v1_package" do
    assert_difference('Api::V1::Package.count', -1) do
      delete api_v1_package_url(@api_v1_package)
    end

    assert_redirected_to api_v1_packages_url
  end
end
