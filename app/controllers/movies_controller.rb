require 'pp'
require 'json'

class MoviesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  def new
  	@movie = Movie.new
  	@hello = params[:movie]
  end

  def destroy
  	Movie.find(params[:id]).destroy
    flash[:success] = "Movie deleted"
    redirect_to movies_path
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
  	@movie = Movie.new(params[:movie])
    if @movie.save 
      redirect_to @movie
    else
      redirect_to user_path current_user
    end
  end

  def edit
  	
  end

  def update
  	
  end

  def index
  	@movies = Movie.paginate(page: params[:page])
  end
end
