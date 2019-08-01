module ReservationsHelper
  def customer_name(reservation)
    if reservation.user_id
      user = User.find(reservation.user_id)
      user.name
    else
      bus_owner = BusOwner.find(reservation.bus_owner_id)
      bus_owner.name
    end
  end


  def formatted_date(date)
    date.strftime("%m/%d/%y")
  end

  def day_name(date)
    date.strftime("%A")
  end


end
