module ReservationsHelper
  def customer_name(reservation)
    reservation.reservable.name
  end


  def formatted_date(date)
    date.strftime("%d/%m/%y")
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
    seats.chomp(',')
  end

  def reservation_status(reservation)
    case reservation.status
    when "cancelled"
      '<p style= "color:red">Cancelled</p>'.html_safe
    when "done"
       '<p style= "color:green">Confirmed</p>'.html_safe
    end
  end



  def reservation_title
    if request.url.include?("my_reservation")
      "My Reservation"
    else
      "Reservation"
    end
  end





end
