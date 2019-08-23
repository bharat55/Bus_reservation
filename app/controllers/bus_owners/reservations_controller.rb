class BusOwners::ReservationsController < ApplicationController
  before_action :authenticate_bus_owner!

  def index
    @bus = Bus.find(params[:bus_id].to_i)
    @reservations = @bus.reservations
  end
end
