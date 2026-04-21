class MoviesController < ApplicationController
  def index
    if params[:is_showing].nil?
      @movies = Movie.all
      @movies = Movie.where('name LIKE?',
                            "%#{params[:keyword]}%").or(Movie.where('description LIKE?', "%#{params[:keyword]}%"))
    else
      params[:is_showing]
      @movies = Movie.where(is_showing: params[:is_showing])
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules.all
    @times = @movie.schedules.select(:start_time, :end_time).distinct
  end

  def reservation
    @screen_id = Schedule.find(params[:schedule_id]).screen.id
    @sheets_order = Sheet.where(screen_id: @screen_id).order(:row, :column).group_by(&:row)
    @movie_id = params[:movie_id]
    if params.include?(:schedule_id)
      @schedule_id = params[:schedule_id]
    else
      head :found
    end
    if params.include?(:date)
      @date = params[:date]
    else
      head :found
    end
    @res_sheet = Reservation.where(date: @date, schedule_id: @schedule_id)
  end
end
