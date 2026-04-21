class Admin::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]
  def index
    @reservations = Reservation.all
    @schedule_id_movie = Schedule.order(:id, :movie_id).group_by(&:id)
    @movies = Movie.order(:id, :name).group_by(&:id)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @movie_name = @reservation.schedule.movie.name
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = '映画予約を作成しました'
      redirect_to admin_reservations_path, status: :found
    else
      flash[:alert] = 'その座席はすでに予約済みです'
      redirect_to admin_reservations_path, status: :bad_request
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @schedule = Schedule.find(@reservation.schedule_id)
    @movie = Movie.find(@schedule.movie_id)
    # @movies_id_name = Movie.order(:id, :name).group_by(&:id)
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = '映画予約を編集しました'
      redirect_to admin_reservations_path, status: :found
    else
      flash[:alert] = 'その座席はすでに予約済みです'
      redirect_to admin_reservations_path, status: :bad_request
    end
  end

  def destroy
    @reservation.destroy
    flash[:notice] = '映画予約を削除しました'
    redirect_to admin_reservations_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name)
  end
end
