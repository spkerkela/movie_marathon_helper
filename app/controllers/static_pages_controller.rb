require 'pp'
require 'json'

class StaticPagesController < ApplicationController

  def home
    if signed_in?
    	@micropost = current_user.microposts.build if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def movie_show
    @mv = Movie.new
  	moviename = params[:movie].downcase
  	url = URI.encode("http://www.omdbapi.com/?t=#{moviename}&plot=full")
  	@movie = JSON.parse HTTParty.get(url).response.body
    if @movie["Response"] == "True"
      @actors = @movie["Actors"].split(/, */)
      @genres = @movie["Genre"].split(/, */)  
    end
  end
end
