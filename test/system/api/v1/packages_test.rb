require "application_system_test_case"

class Api::V1::PackagesTest < ApplicationSystemTestCase
  setup do
    @api_v1_package = api_v1_packages(:one)
  end

  test "visiting the index" do
    visit api_v1_packages_url
    assert_selector "h1", text: "Api/V1/Packages"
  end

  test "creating a Package" do
    visit api_v1_packages_url
    click_on "New Api/V1/Package"

    click_on "Create Package"

    assert_text "Package was successfully created"
    click_on "Back"
  end

  test "updating a Package" do
    visit api_v1_packages_url
    click_on "Edit", match: :first

    click_on "Update Package"

    assert_text "Package was successfully updated"
    click_on "Back"
  end

  test "destroying a Package" do
    visit api_v1_packages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Package was successfully destroyed"
  end
end
