module Admin::ReservationsHelper

  def Admin_reservation_title(owner,bus)
    if owner
      "Reservations through #{owner.name}'s Buses"
    elsif bus
      "Reservations of #{bus.name}"
    else
      "All Reservations"
    end
  end
end
