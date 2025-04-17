# app/controllers/admin/movies_controller.rb

class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to admin_movies_path, notice: "登録しました"
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end

  rescue => e
    logger.error("エラー発生: #{e.message}")
    flash.new[:alert] = "予期せぬエラーが発生しました"
    render :new
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
  end

end
