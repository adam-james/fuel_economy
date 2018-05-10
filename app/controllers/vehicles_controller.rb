class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.page(params[:page])
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :year)
    end
end
