# app/controllers/admin/movies_controller.rb

class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
end
