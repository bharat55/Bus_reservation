class BusesController < ApplicationController
  # before_action :authorised_person, only:[:edit,:update,:active,:suspend]
  before_action :require_search_params, only:[:index]
  # before_action :required_signin, except:[:index]


  # GET /buses
  # GET /buses.json
  def index
    if params[:commit] == "Search"
      @buses = Bus.search(params[:source],params[:destination])
      if params[:date].blank?
        @date = Date.current
      else
        @date = params[:date]
      end
    else
      @buses = Bus.all
      @date = Date.current
    end
  end

  # GET /buses/1
  # GET /buses/1.json


  # GET /buses/new


  private
    # Use callbacks to share common setup or constraints between actions.



    def require_search_params
      if params[:commit] == "Search"
        unless !params[:source].blank? || !params[:destination].blank?
          flash[:error] = "Please fill either source or destination or both!!"
          redirect_to root_path
        end
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
end





