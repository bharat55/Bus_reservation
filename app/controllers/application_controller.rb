class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    helper_method :available_seats, :required_admin, :check_reserved_seat,:customer

    def available_seats(bus,date)
      r =  (Reservation.where(bus_id:bus.id,date:date,status:"done")).map(&:total_seats)
      booked = r.inject(0){|sum,x| sum + x }
      bus.total_seats - booked
    end


    def required_admin
      unless current_user&&     current_user.admin?
        flash[:error] = "You are not authorised person to access!! "
        redirect_to root_path
      end
    end

  def check_reserved_seat(bus, date)
  current_reservation = bus.reservations.where(date: date,status:"done")
    seats = current_reservation.map{|res|  res.reservation_seats}.flatten.map(&:seat_no)
  end






    # def authorised_person
    #   unless current_bus_owner || current_user.admin?
    #     flash[:error] = "You are not authorised person to proceed!!"
    #     redirect_to root_path
    #   end
    # end



    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gst_number, :license_number,:experience
    ])
    end

    def required_signin
      if current_user
        authenticate_user!
      else
        authenticate_bus_owner!
      end
    end


end
