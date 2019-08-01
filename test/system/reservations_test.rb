require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Bus", with: @reservation.bus_id
    fill_in "Bus owner", with: @reservation.bus_owner_id
    fill_in "Date", with: @reservation.date
    fill_in "From", with: @reservation.from
    fill_in "Seats", with: @reservation.seats
    fill_in "Time", with: @reservation.time
    fill_in "To", with: @reservation.to
    fill_in "User", with: @reservation.user_id
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Bus", with: @reservation.bus_id
    fill_in "Bus owner", with: @reservation.bus_owner_id
    fill_in "Date", with: @reservation.date
    fill_in "From", with: @reservation.from
    fill_in "Seats", with: @reservation.seats
    fill_in "Time", with: @reservation.time
    fill_in "To", with: @reservation.to
    fill_in "User", with: @reservation.user_id
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
