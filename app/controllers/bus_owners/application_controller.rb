class BusOwners::ApplicationController < ActionController::Base
  layout "application"

  before_action :authenticate_bus_owner!
end
