class BusOwnersController < ApplicationController
  before_action :find_owner ,only:[:show,:approve,:disapprove,:suspend]



  def show
  end


  private


  def find_owner
    if params[:id]
      @bus_owner = BusOwner.find(params[:id])
    else
      @bus_owner = BusOwner.find(params[:bus_owner_id])
    end
  end



end
