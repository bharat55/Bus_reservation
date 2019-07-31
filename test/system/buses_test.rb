require "application_system_test_case"

class BusesTest < ApplicationSystemTestCase
  setup do
    @bus = buses(:one)
  end

  test "visiting the index" do
    visit buses_url
    assert_selector "h1", text: "Buses"
  end

  test "creating a Bus" do
    visit buses_url
    click_on "New Bus"

    fill_in "Arrival time", with: @bus.arrival_time
    fill_in "Bus owners", with: @bus.bus_owners_id
    fill_in "Departure time", with: @bus.departure_time
    fill_in "Destination", with: @bus.destination
    fill_in "Name", with: @bus.name
    fill_in "Registration number", with: @bus.registration_number
    fill_in "Source", with: @bus.source
    fill_in "Total seats", with: @bus.total_seats
    click_on "Create Bus"

    assert_text "Bus was successfully created"
    click_on "Back"
  end

  test "updating a Bus" do
    visit buses_url
    click_on "Edit", match: :first

    fill_in "Arrival time", with: @bus.arrival_time
    fill_in "Bus owners", with: @bus.bus_owners_id
    fill_in "Departure time", with: @bus.departure_time
    fill_in "Destination", with: @bus.destination
    fill_in "Name", with: @bus.name
    fill_in "Registration number", with: @bus.registration_number
    fill_in "Source", with: @bus.source
    fill_in "Total seats", with: @bus.total_seats
    click_on "Update Bus"

    assert_text "Bus was successfully updated"
    click_on "Back"
  end

  test "destroying a Bus" do
    visit buses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bus was successfully destroyed"
  end
end
