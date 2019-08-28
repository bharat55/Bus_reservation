class Admin::BusOwnersController < ApplicationController
  before_action :required_admin
  before_action :find_owner,except:[:index]


  def index
    @bus_owners = BusOwner.all
  end


  def show
  end



  def approve
    @bus_owner.status = "approved"
    if @bus_owner.save
      flash[:notice] = "#{@bus_owner.name} is approved to access the system !"
      redirect_to admin_bus_owners_path
    end
  end


  def suspend
    @bus_owner.status = "suspended"
    if @bus_owner.save
      flash[:error] = "#{@bus_owner.name} is suspended, and can not access the system now !!"
      redirect_to admin_bus_owners_path
    end
  end

  private
  def find_owner
     @bus_owner = BusOwner.find(params[:id])
  end

  def required_admin
    unless current_user && current_user.admin?
      flash[:error] = "You are not Authorised person to be continue!!"
      redirect_to root_path
    end
  end
end
