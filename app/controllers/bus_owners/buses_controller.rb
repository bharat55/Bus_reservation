class BusOwners::BusesController < ApplicationController
  before_action :find_bus ,except:[:new,:create]
  # before_action :authenticate_bus_owner!
  before_action :required_valid_bus_owner, only: [:new,:create]
  before_action :same_bus_owner, only: [:edit,:update]

  def show
  end

  def new
    @bus = Bus.new
  end

  # GET /buses/1/edit



  # POST /buses
  # POST /buses.json
  def create
    @bus = Bus.new(bus_params)
    @bus.bus_owner = current_bus_owner
    respond_to do |format|
      if @bus.save
        format.html { redirect_to root_path, notice: 'Bus was successfully created.' }
        format.json { render :show, status: :created, location: @bus }
      else
        format.html { render :new }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end


  def edit
  end
  # PATCH/PUT /buses/1
  # PATCH/PUT /buses/1.json
  def update
    respond_to do |format|
      if @bus.update(bus_params)
        format.html { redirect_to  bus_owners_bus_path(@bus), notice: 'Bus was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus }
      else
        format.html { render :edit }
        format.json { render json: @bus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buses/1
  # DELETE /buses/1.json
  def destroy
    @bus.destroy
    respond_to do |format|
      format.html { redirect_to buses_url, notice: 'Bus was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def active
    if @bus.suspended_by != "admin"
      @bus.status = "active"
      @bus.suspended_by = ""
      if @bus.save
        flash[:notice] = "Bus Activated, Ready to Go!"
        redirect_to profile_bus_owners_path
      end
    else
      flash[:error] = "Suspended By Admin!!!"
      redirect_to profile_bus_owners_path
    end
  end


  def suspend
     @bus.status = "suspended"
     @bus.suspended_by = "bus_owner"
    if @bus.save
      flash[:error] = "Bus Suspended!!!"
      redirect_to profile_bus_owners_path
    end
  end


  private

   def bus_params
      params.require(:bus).permit(:name, :registration_number, :source, :destination, :total_seats, :bus_owners_id, :departure_time, :arrival_time)
    end

  def find_bus
    @bus = Bus.find(params[:id])
  end

  def required_valid_bus_owner
    unless current_bus_owner && current_bus_owner.status == "approved"
      flash[:error] = "You are not authorized to add bus !!! "
      redirect_to root_path
    end
  end


  def same_bus_owner
    unless @bus.bus_owner == current_bus_owner
      flash[:error] = "You are not Authorised person to continue.. "
      redirect_to root_path
    end
  end



end
