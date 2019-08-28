  class ReservationsController < ApplicationController
    before_action :required_signin
    before_action :find_bus,only:[:create,:valid_bus]
    # before_action :set_reservation, only: [:show, :edit, :update, :destroy]
    before_action :valid_date ,:valid_seat_counts,only:[:create]
    before_action :valid_bus,only:[:new,:create]


    # GET /reservations
    # GET /reservations.json
    def index
      if params[:scope]
        @reservations = customer.reservations.order("date")
      else
        @reservations = Reservation.all
      end
    end

    # GET /reservations/1
    # GET /reservations/1.json
    # def show
    # end

    # GET /reservations/new
    def new
      @reservation= Reservation.new
      @bus  = Bus.find(params[:bus_id])
    end

    # GET /reservations/1/edit
    # def edit
    # end

    # POST /reservations
    # POST /reservations.json
    def create
      @reservation = customer.reservations.new(reservation_params)
      @reservation.bus = @bus
      @reservation.from = @bus.source
      @reservation.to = @bus.destination

      respond_to do |format|
        if  @reservation.save
          format.html { redirect_to root_path, notice: 'Reservation was successfully created.' }
          format.json { render :show, status: :created, location: @reservation }
        else
          format.html { render :new }
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /reservations/1
    # PATCH/PUT /reservations/1.json
    # def update
    #   respond_to do |format|
    #     if @reservation.update(reservation_params)
    #       format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
    #       format.json { render :show, status: :ok, location: @reservation }
    #     else
    #       format.html { render :edit }
    #       format.json { render json: @reservation.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # DELETE /reservations/1
    # DELETE /reservations/1.json
    # def destroy
    #   @reservation.destroy
    #   respond_to do |format|
    #     format.html { redirect_to request.referrer, notice: 'Reservation was successfully destroyed.' }
    #     format.json { head :no_content }
    #   end
    # end

    def cancel
      @bus = Bus.find(params[:bus_id])
      @reservation = @bus.reservations.find(params[:reservation_id])
      @reservation.status = "cancelled"
      if @reservation.save
        flash[:error] = "Reservation cancelled!!!"
        redirect_to  request.referrer
      end
    end



    private
      # Use callbacks to share common setup or constraints between actions.
      # def set_reservation
      #   @reservation = Reservation.find(params[:id])
      # end


      # Never trust parameters from the scary internet, only allow the white list through.
      def reservation_params
        params.require(:reservation).permit(:bus_id , :total_seats, :date, seat_nos: [])
      end


      # def on_date
      #   reservation = params["reservation"]
      #   date = reservation[:date]
      #   @date = date.to_date
      # end

      # def valid_seats
      #   if reservation_params[:total_seats]
      #     unless (available_seats(@bus,on_date) - ((reservation_params[:total_seats]).to_i) ) >= 0
      #       flash[:error] = "#{reservation_params[:seats]} seats are not available for this bus on #{on_date}!!"
      #       redirect_to root_path
      #     end
      #   end

      # end

      def valid_date
        if !reservation_params[:date].blank?
          unless reservation_params[:date].to_date >= Date.current
            flash[:error] = "Invalid Date!!"
            redirect_to new_bus_reservation_path(@bus)
          end
        end
      end

      def find_bus
        @bus = Bus.find(params[:bus_id])
      end

      def valid_seat_counts
        if !reservation_params[:total_seats].blank? && reservation_params[:seat_nos]
          unless reservation_params[:total_seats].to_i == reservation_params[:seat_nos].count
            flash[:error] = "total seats doesn't matches to selected seats!!"
            redirect_to new_bus_reservation_path
            # format.html { render :new }z
          end
        end
      end


  def customer
    if current_user
      current_user
    elsif current_bus_owner
      current_bus_owner
    end
  end

  def valid_bus
    @bus = Bus.find(params[:bus_id])
    unless @bus.bus_owner.approved?
      flash[:error]="Not a valid bus try another!!!"
      redirect_to root_path
    end
  end



  end
