class ReservationsController < ApplicationController
  def index
    @sheets = Sheet.all
    @sheets_order = Sheet.order(:row, :column).group_by(&:row)
    @movie_id = params[:movie_id]
    @schedule_id = params[:schedule_id]
    @date = params[:date]
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new(schedule_id: params[:schedule_id])
    if params.include?(:sheet_id)
      @sheet_id = params[:sheet_id]
    else
      head :bad_request
    end
    if params.include?(:date)
      @date = params[:date]
    else
      head :bad_request
    end
    @reservation.date = @date
    @reservation.sheet_id = @sheet_id
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = '映画予約を作成しました'
      redirect_to "/movies/#{params[:movie_id]}"
    else
      flash[:alert] = 'その座席はすでに予約済みです'
      redirect_to "/movies/#{Schedule.find(@reservation.schedule_id).movie_id}/reservation?date=#{@reservation.date}&schedule_id=#{@reservation.schedule_id}"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :schedule_id, :sheet_id, :email, :name)
  end
end
