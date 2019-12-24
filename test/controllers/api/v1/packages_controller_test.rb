require 'test_helper'

class Api::V1::PackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
  end

  def load_file file_name
    file = File.open("test/controllers/api/v1/#{file_name}", "r")
    data = file.read
    file.close
    data
  end

  test "should create package by api" do
    single_label = load_file 'single_label.json'
    post '/api/v1/packages', params: { package: [ JSON.parse(single_label)] }
    assert_response :success
  end

  test "should create and validate fedex create service" do
    single_label = load_file 'single_label.json'
    post '/api/v1/packages', params: { package: [ JSON.parse(single_label)] }
    tag_processed = JSON.parse(response.body).first.dig('tag_processed')
    assert_equal true, tag_processed
  end

end
