module BusesHelper
  def formate_time(time)
    time.strftime("%I:%M:%p")
  end

  def format_date(date)
    date.strftime("%a, %d-%m-%y")
  end



  def book_if_seat_available(bus,date)
    if available_seats(bus,date) > 0
     link_to t('.Book seat', :default => t("helpers.links.Book seat")),new_bus_reservation_path(bus),:class => 'btn btn-default btn-xs btn-success'
    else
        link_to t('.Unavailable', :default => t("helpers.links.Unavailable")),
                      :class => 'btn-default btn-danger'
    end
  end


  def owner_approved?(bus)
    bus.bus_owner.approved?
  end


  def rightfull_person?(bus)
    bus.bus_owner == current_bus_owner
  end

  def status_button(bus)
    if current_user && current_user.admin?
      case bus.status
      when "active"
       link_to t('.suspend', :default => t("helpers.links.suspend")),suspend_admin_bus_path(bus),
        :class => 'btn btn-default btn-xs btn-danger'
      when "suspended"
        link_to t('.active', :default => t("helpers.links.active")),active_admin_bus_path(bus),
        :class => 'btn btn-default btn-xs btn-success'
      end
    else
      case bus.status
      when "active"
       link_to t('.suspend', :default => t("helpers.links.suspend")),suspend_bus_owners_bus_path(bus),
        :class => 'btn btn-default btn-xs btn-danger'
      when "suspended"
        link_to t('.active', :default => t("helpers.links.active")), active_bus_owners_bus_path(bus),
        :class => 'btn btn-default btn-xs btn-success'
      end
    end
  end

end

