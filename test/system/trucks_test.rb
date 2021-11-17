require "application_system_test_case"

class TrucksTest < ApplicationSystemTestCase
  setup do
    @truck = trucks(:one)
  end

  test "visiting the index" do
    visit trucks_url
    assert_selector "h1", text: "Trucks"
  end

  test "creating a Truck" do
    visit trucks_url
    click_on "New Truck"

    fill_in "Commune", with: @truck.commune
    fill_in "Description", with: @truck.description
    fill_in "Image", with: @truck.image
    fill_in "Rate", with: @truck.rate
    fill_in "Region", with: @truck.region
    fill_in "Tonnage", with: @truck.tonnage
    fill_in "Type truck", with: @truck.type_truck_id
    fill_in "User", with: @truck.user_id
    click_on "Create Truck"

    assert_text "Truck was successfully created"
    click_on "Back"
  end

  test "updating a Truck" do
    visit trucks_url
    click_on "Edit", match: :first

    fill_in "Commune", with: @truck.commune
    fill_in "Description", with: @truck.description
    fill_in "Image", with: @truck.image
    fill_in "Rate", with: @truck.rate
    fill_in "Region", with: @truck.region
    fill_in "Tonnage", with: @truck.tonnage
    fill_in "Type truck", with: @truck.type_truck_id
    fill_in "User", with: @truck.user_id
    click_on "Update Truck"

    assert_text "Truck was successfully updated"
    click_on "Back"
  end

  test "destroying a Truck" do
    visit trucks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Truck was successfully destroyed"
  end
end
