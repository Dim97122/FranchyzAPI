class Api::V1::CoachesController < ApplicationController
  before_action :authenticate_coach!, only: [:update]
  before_action :decode_token, only: [:create, :edit, :update, :delete]
  # before_action :check_admin, only: [:create, :edit, :update, :delete]
  before_action :set_coach, only: [:show, :update, :destroy]

  def show
    render json: @coach
  end

  def update
    if @coach.update(coach_params)
      render json: @coach
    else
      render json: @coach.errors, status: :unprocessable_entity
    end
  end


  private
  def set_coach
    @coach = Coach.find(params[:id])
  end

  def coach_params
    params.require(:coach).permit(:first_name, :last_name, :phone, :birthdate, :arrival, :admin?, :club_id)
  end
end
