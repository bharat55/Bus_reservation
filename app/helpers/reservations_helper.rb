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

  def seat_numbers(reservation)
    seats = ""
    array = reservation.reservation_seats.map(&:seat_no)
    array.each do |seat|
      seats += "#{seat},"
    end
    seats
  end



end
