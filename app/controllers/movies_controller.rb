class MoviesController < ApplicationController
  def index
    if params[:is_showing] ==  nil
      @movies = Movie.all
      @movies = Movie.where("name LIKE?", "%#{params[:keyword]}%").or(Movie.where("description LIKE?", "%#{params[:keyword]}%"))
    else params[:is_showing] !=  "全て"
      @movies = Movie.where(is_showing: params[:is_showing])
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules.all
  end

  def reservation
    @sheets = Sheet.all
    @sheets_order = Sheet.order(:row, :column).group_by(&:row)
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
    @res_sheet = Reservation.where(date:@date ,schedule_id: @schedule_id) 
    # @reservation_exist = @res_sheet.map {|res| res.sheet_id}
    puts @res_sheet
  end
end
