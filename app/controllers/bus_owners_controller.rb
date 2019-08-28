class BusOwnersController < ApplicationController
  def profile
    @bus_owner = BusOwner.find(current_bus_owner.id)
  end
end
