class Admin::MoviesController < ApplicationController
    before_action :set_movie, only: %i[ show edit update destroy ]

    def index
        @movies = Movie.all
    end

    def show
        @movies = Movie.find(params[:id])
    end

    def new
        @movies = Movie.new
    end

    def create
        @movies = Movie.new(movie_params)
        if @movies.save
            flash[:notice] = '作成しました'
            redirect_to admin_movies_path
        else
            render 'new'
        end
    end

    def edit
        @movies = Movie.find(params[:id])
    end

    def update
        @movies = Movie.find(params[:id])
        if @movies.update(movie_params)
            flash[:notice] = '更新しました'
            redirect_to admin_movies_path
        else
            render 'new'
        end
    end

    def destroy
        if @movies.destroy
            flash[:notice] = '削除しました'
        end
        redirect_to admin_movies_path()
    end

    private
    def set_movie
        @movies = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
    end
end
