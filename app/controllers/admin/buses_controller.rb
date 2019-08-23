class Admin::BusesController < ApplicationController
  before_action :find_bus


  def edit

  end

  def active
    if @bus.suspended_by != "bus_owner"
      @bus.status = "active"
      @bus.suspended_by = ""
      if @bus.save
        flash[:notice] = "Bus Activated, Ready to Go!"
        redirect_to @bus.bus_owner
      end
    else
      flash[:error] = "Suspended By Bus_owner!!!"
      redirect_to @bus.bus_owner
    end
  end


  def suspend
    @bus.status = "suspended"
    @bus.suspended_by = "admin"
    if @bus.save
      flash[:error] = "Bus Suspended!!!"
      redirect_to @bus.bus_owner
    end
  end


  private

  def find_bus
    @bus = Bus.find(params[:id])
  end


end
