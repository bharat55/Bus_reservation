class BookBusSeatsController < ApplicationController
  # before_action :required_signin
  #  before_action :find_bus,only:[:create]
  # before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # before_action :valid_seats,:valid_date ,only:[:create]

  def index
    @bus = Bus.find(params[:bus_id])
    @date = params[:date]
    @total_seats = Array(1..@bus.total_seats)
  end
end
