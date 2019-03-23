require 'test_helper'

class ProtestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @protest = protests(:one)
  end

  test "should get index" do
    get protests_url
    assert_response :success
  end

  test "should get new" do
    get new_protest_url
    assert_response :success
  end

  test "should create protest" do
    assert_difference('Protest.count') do
      post protests_url, params: { protest: { description: @protest.description, location: @protest.location, name: @protest.name, organizer_id: @protest.organizer_id, what_to_bring: @protest.what_to_bring } }
    end

    assert_redirected_to protest_url(Protest.last)
  end

  test "should show protest" do
    get protest_url(@protest)
    assert_response :success
  end

  test "should get edit" do
    get edit_protest_url(@protest)
    assert_response :success
  end

  test "should update protest" do
    patch protest_url(@protest), params: { protest: { description: @protest.description, location: @protest.location, name: @protest.name, organizer_id: @protest.organizer_id, what_to_bring: @protest.what_to_bring } }
    assert_redirected_to protest_url(@protest)
  end

  test "should destroy protest" do
    assert_difference('Protest.count', -1) do
      delete protest_url(@protest)
    end

    assert_redirected_to protests_url
  end
end
