module BusesHelper
  def formate_time(time)
    time.strftime("%I:%M:%p")
  end



  def book_if_seat_available(bus)
    if available_seats(bus) > 0
     link_to t('.Book seat', :default => t("helpers.links.Book seat")),new_reservation_path(bus),:class => 'btn btn-default btn-xs btn-success'
    else
        link_to t('.Unavailable', :default => t("helpers.links.Unavailable")),
                      :class => 'btn-default btn-danger'
    end
  end


  def owner_approved?(bus)
    bus.bus_owner.approve?
  end
end

