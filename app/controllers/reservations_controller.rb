    class ReservationsController < ApplicationController
      before_action :required_signin
      before_action :set_reservation, only: [:show, :edit, :update, :destroy]
      before_action :valid_seats ,only:[:create]

      # GET /reservations
      # GET /reservations.json
      def index
        case params[:scope]
        when "my_reservation"
          @reservations = Reservation.my_reservation(customer_id)
        else
          @reservations = Reservation.all
        end
      end

      # GET /reservations/1
      # GET /reservations/1.json
      def show
      end

      # GET /reservations/new
      def new
        @reservation= Reservation.new
        @@bus  = Bus.find(params[:id])
      end

      # GET /reservations/1/edit
      def edit
      end

      # POST /reservations
      # POST /reservations.json
      def create
        @reservation = @@bus.reservations.new(reservation_params)
        @reservation.user_id = user_id
        @reservation.bus_owner_id = bus_owner_id
        @reservation.from = @@bus.source
        @reservation.to = @@bus.destination
        respond_to do |format|
          if @reservation.save
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
      def update
        respond_to do |format|
          if @reservation.update(reservation_params)
            format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
            format.json { render :show, status: :ok, location: @reservation }
          else
            format.html { render :edit }
            format.json { render json: @reservation.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /reservations/1
      # DELETE /reservations/1.json
      def destroy
        @reservation.destroy
        respond_to do |format|
          format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_reservation
          @reservation = Reservation.find(params[:id])
        end

        def user_id
          if current_user
            current_user.id
          else
            nil
          end
        end

        def bus_owner_id
          if current_bus_owner
            current_bus_owner.id
          else
            nil
          end
        end


        # Never trust parameters from the scary internet, only allow the white list through.
        def reservation_params
          params.require(:reservation).permit(:bus_id , :user_id, :bus_owner_id, :seats, :date, :time, :from, :to)
        end

        def valid_seats

          unless (available_seats(@@bus) - ((reservation_params[:seats]).to_i) ) >= 0
            flash[:error] = "#{reservation_params[:seats]} seats are not available for this bus!!"
            redirect_to root_path
          end
        end
    end
