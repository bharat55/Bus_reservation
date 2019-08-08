class HomeController < ApplicationController


  def index
    if params[:source]
      @buses = Bus.search(params[:source], params[:destination])
      if @buses.blank?
        flash[:error] = "No bus available bus this root !!"
        redirect_to root_path
      else
        @buses
        @date = params[:date]
      end
    end
  end
end
