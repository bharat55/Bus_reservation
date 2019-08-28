class Admin::ReservationsController < ApplicationController

  def index
    if params[:bus_owner_id]
      @owner = BusOwner.find(params[:bus_owner_id])
      @reservations = @owner.buses.map{|bus| bus.reservations}.flatten
    elsif params[:bus_id]
      @bus = Bus.find(params[:bus_id])
      @reservations = @bus.reservations
    else
      @reservations = Reservation.all
    end
  end



end
