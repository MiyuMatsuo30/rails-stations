class Admin::MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.all
    @schedules = Schedule.all
    @movies_id_name = Movie.order(:id, :name).group_by(&:id)
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = Schedule.where(movie_id: params[:id].to_i)
    @movies_id_name = Movie.order(:id, :name).group_by(&:id)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = '映画作品を作成しました'
      redirect_to admin_movies_path
    else
      flash[:alert] = '映画作品の作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = '映画作品を更新しました'
      redirect_to admin_movies_path
    else
      flash[:alert] = '映画作品の更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    flash[:notice] = '映画作品を削除しました' if @movie.destroy
    redirect_to admin_movies_path
  end

    private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
  end
end
