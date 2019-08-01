class BusOwnersController < ApplicationController
  before_action :find_owner ,only:[:show,:approve,:disapprove,:suspend]
  before_action :required_admin,only:[:index]



  def index
    @bus_owners = BusOwner.all
  end



  def show

  end

  def approve
    @bus_owner.status = "approve"
    if @bus_owner.save
      flash[:notice] = "#{@bus_owner.name} is approved to access the system !"
      redirect_to bus_owners_path
    end
  end

  def disapprove
    @bus_owner.status = "disapprove"
    if @bus_owner.save
      flash[:error] = "#{@bus_owner.name} is disapproved, and can not access the system now !!"
      redirect_to bus_owners_path
    end
  end

  def suspend
    @bus_owner.status = "suspend"
    if @bus_owner.save
      flash[:error] = "#{@bus_owner.name} is suspended, and can not access the system now !!"
      redirect_to bus_owners_path
    end
  end

  private
  def find_owner
    @bus_owner = BusOwner.find(params[:id])
  end



end
