require 'test_helper'

class TrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @truck = trucks(:one)
  end

  test "should get index" do
    get trucks_url
    assert_response :success
  end

  test "should get new" do
    get new_truck_url
    assert_response :success
  end

  test "should create truck" do
    assert_difference('Truck.count') do
      post trucks_url, params: { truck: { commune: @truck.commune, description: @truck.description, image: @truck.image, rate: @truck.rate, region: @truck.region, tonnage: @truck.tonnage, type_truck_id: @truck.type_truck_id, user_id: @truck.user_id } }
    end

    assert_redirected_to truck_url(Truck.last)
  end

  test "should show truck" do
    get truck_url(@truck)
    assert_response :success
  end

  test "should get edit" do
    get edit_truck_url(@truck)
    assert_response :success
  end

  test "should update truck" do
    patch truck_url(@truck), params: { truck: { commune: @truck.commune, description: @truck.description, image: @truck.image, rate: @truck.rate, region: @truck.region, tonnage: @truck.tonnage, type_truck_id: @truck.type_truck_id, user_id: @truck.user_id } }
    assert_redirected_to truck_url(@truck)
  end

  test "should destroy truck" do
    assert_difference('Truck.count', -1) do
      delete truck_url(@truck)
    end

    assert_redirected_to trucks_url
  end
end