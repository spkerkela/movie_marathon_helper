require 'pp'
require 'json'

class StaticPagesController < ApplicationController

  def home
  end

  def help
  end

  def movie_show
  	url = URI.encode("http://www.omdbapi.com/?t=cyborg")
  	@movie = JSON.parse HTTParty.get(url).response.body
  end
end
