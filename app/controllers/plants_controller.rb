class PlantsController < ApplicationController
  wrap_parameters format: []

  def index
    render json: Plant.all
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant
    else 
      render json: { error: "Plant not found" }, status: :not_found
    end
  end

  def create
    render json: Plant.create(new_plant), status: :created
  end

  private

  def new_plant
    params.permit(:name, :image, :price)
  end

end
