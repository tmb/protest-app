require "application_system_test_case"

class ProtestsTest < ApplicationSystemTestCase
  setup do
    @protest = protests(:one)
  end

  test "visiting the index" do
    visit protests_url
    assert_selector "h1", text: "Protests"
  end

  test "creating a Protest" do
    visit protests_url
    click_on "New Protest"

    fill_in "Description", with: @protest.description
    fill_in "Location", with: @protest.location
    fill_in "Name", with: @protest.name
    fill_in "Organizer", with: @protest.organizer_id
    fill_in "What to bring", with: @protest.what_to_bring
    click_on "Create Protest"

    assert_text "Protest was successfully created"
    click_on "Back"
  end

  test "updating a Protest" do
    visit protests_url
    click_on "Edit", match: :first

    fill_in "Description", with: @protest.description
    fill_in "Location", with: @protest.location
    fill_in "Name", with: @protest.name
    fill_in "Organizer", with: @protest.organizer_id
    fill_in "What to bring", with: @protest.what_to_bring
    click_on "Update Protest"

    assert_text "Protest was successfully updated"
    click_on "Back"
  end

  test "destroying a Protest" do
    visit protests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Protest was successfully destroyed"
  end
end
