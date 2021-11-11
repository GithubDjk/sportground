require "application_system_test_case"

class FutsalsTest < ApplicationSystemTestCase
  setup do
    @futsal = futsals(:one)
  end

  test "visiting the index" do
    visit futsals_url
    assert_selector "h1", text: "Futsals"
  end

  test "creating a Futsal" do
    visit futsals_url
    click_on "New Futsal"

    fill_in "Location", with: @futsal.location
    fill_in "Name", with: @futsal.name
    click_on "Create Futsal"

    assert_text "Futsal was successfully created"
    click_on "Back"
  end

  test "updating a Futsal" do
    visit futsals_url
    click_on "Edit", match: :first

    fill_in "Location", with: @futsal.location
    fill_in "Name", with: @futsal.name
    click_on "Update Futsal"

    assert_text "Futsal was successfully updated"
    click_on "Back"
  end

  test "destroying a Futsal" do
    visit futsals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Futsal was successfully destroyed"
  end
end
