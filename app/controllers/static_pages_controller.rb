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
  	movie = params[:movie].downcase
  	url = URI.encode("http://www.omdbapi.com/?t=#{movie}&plot=full")
  	@movie = JSON.parse HTTParty.get(url).response.body
  end
end
