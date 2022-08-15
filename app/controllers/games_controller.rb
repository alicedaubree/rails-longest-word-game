require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = Array("A".."Z").sample(10)
    return @letters
  end

  def score
    @guess = params[:guess]
    @guess_array = @guess.upcase.split("")
    @letters_array = params[:letters].split(" ").uniq()
    @valid = @guess_array.all? { |letter| @letters_array.include?(letter) }
    url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
    file = URI.open(url).read
    data = JSON.parse(file)
    @result = data["found"]
  end
end
