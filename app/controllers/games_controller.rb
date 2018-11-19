require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ("A".."Z").to_a.shuffle.first(10)
  end

  def score
    @word = params[:word]
    @letters = params[:letters].split(" ")
    @valid = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@word}").read)
    # if session[:score] == nil
    #   session[:score] = @score
    # else
    #   session[:score] += @score
    # end
  end
end
