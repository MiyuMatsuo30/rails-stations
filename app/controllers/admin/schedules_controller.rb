class Admin::SchedulesController < ApplicationController
  before_action :set_schedule, only: %i[show edit update destroy]
  def index
    @movie = Movie.find(params[:movie_id])
    @schedules = @movie.schedules.all
    @movies_id_name = Movie.order(:id, :name).group_by(&:id)
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:id])
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @schedule = @movie.schedules.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      flash[:notice] = 'スケジュールを作成しました'
      redirect_to admin_movie_path(params[:movie_id])
    else
      flash[:alert] = 'スケジュールの作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      flash[:notice] = 'スケジュールを更新しました'
      redirect_to admin_movie_path(params[:movie_id])
    else
      flash[:alert] = 'スケジュールの更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @schedule.destroy
    flash[:notice] = 'スケジュールを削除しました'
    redirect_to admin_movie_path(params[:movie_id])
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:movie_id, :start_time, :end_time)
  end
end
