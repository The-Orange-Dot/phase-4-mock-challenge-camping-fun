class CampersController < ApplicationController

  def index
    render json: Camper.all
  end


  def show
    camper = Camper.find_by(id: params[:id])
    if camper
      render json: camper, include: :activities
    else
      render json: {error: "Camper not found"}, status: :not_found
    end
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end


  private

  def camper_params
    params.permit(:name, :age)
  end
end
