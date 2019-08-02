class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    helper_method :available_seats, :required_admin

    def available_seats(bus)
      r =  (Reservation.where(bus_id:bus.id,date:Date.current)).map(&:seats)
      booked = r.inject(0){|sum,x| sum + x }
      bus.total_seats - booked
    end


    def required_admin
      unless current_user.admin?
        flash[:error] = "You are not authorised person to access!! "
        redirect_to root_path
      end
    end



    def customer_id
      if current_user
        current_user.id
      else
        current_bus_owner.id
      end
    end


    def authorised_person
      unless current_bus_owner || current_user.admin?
        flash[:error] = "You are not authorised person to proceed!!"
        redirect_to root_path
      end
    end



    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :gst_number, :license_number,:experience
    ])
    end

    def required_signin
      unless current_user || current_bus_owner
        flash[:error]  = "logIn Required!!!!!!!!"
        redirect_to root_path
      end
    end


end
