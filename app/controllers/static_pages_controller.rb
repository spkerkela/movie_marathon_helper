require 'pp'
require 'json'

class StaticPagesController < ApplicationController

  def home
  end

  def help
  end

  def movie_show
  	movie = params[:movie].downcase
  	url = URI.encode("http://www.omdbapi.com/?t=#{movie}&plot=full")
  	@movie = JSON.parse HTTParty.get(url).response.body
  end
end
