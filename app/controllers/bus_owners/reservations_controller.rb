class BusOwners::ReservationsController < ApplicationController
  before_action :authenticate_bus_owner!

  def index
    if params[:bus_id]
      @bus = Bus.find(params[:bus_id].to_i)
      @reservations = @bus.reservations
    else
      @reservations = current_bus_owner.buses.map{|bus| bus.reservations}.flatten
    end
  end


end
