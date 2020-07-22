class Api::V1::AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :update, :destroy]

  # GET /attendances
  # GET /attendances.json
  def index
    @attendances = Attendance.all
    render json: @attendances
  end

  # GET /attendances/1
  # GET /attendances/1.json
  def show
    render json: @attendance
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      render :show, status: :created, location: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attendances/1
  # PATCH/PUT /attendances/1.json
  def update
    if @attendance.update(attendance_params)
      render :show, status: :ok, location: @attendance
    else
      render json: @attendance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:player_id, :game_id, :practice_id, :confirmed?)
    end
end
