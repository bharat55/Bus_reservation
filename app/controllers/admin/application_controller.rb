class Admin::ApplicationController < ActionController::Base
    layout 'admin'

    before_action :required_admin
    helper_method :available_seats



    def required_admin
      unless current_user&&     current_user.admin?
        flash[:error] = "You are not authorised person to access!! "
        redirect_to root_path
      end
    end


    def available_seats(bus,date)
      r =  (Reservation.where(bus_id:bus.id,date:date,status:"done")).map(&:total_seats)
      booked = r.inject(0){|sum,x| sum + x }
      bus.total_seats - booked
    end

end
