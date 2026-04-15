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
    @schedules = Schedule.where(movie_id: params[:id].to_i)
  end
end
