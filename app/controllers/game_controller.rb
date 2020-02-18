require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def play
    alphabet = ('A'..'Z').to_a
    @letters = 10.times.map { alphabet.sample }
    @grid = @letters.join.downcase
  end
  def result
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    score_serialized = open(url).read
    score = JSON.parse(score_serialized)
    final = score["length"].to_i ** 2
    @grid = params[:grid]
    @message = if score["found"] == false
                 "Word '#{score["word"]}' does not exist"
               elsif score["found"] == true && @word.chars.all? { |letter| @word.count(letter) <= @grid.count(letter) }
                 "Your word '#{score["word"]}' has a total score of #{final}"
               elsif score["found"] == true
                 "Sorry, but #{@word} cannot be build out of the given grid: '#{@grid}'"
               end
  end
end


  # def timer
  #   @timer1 = Time.now
  #   if params[:start]
  #     @timer
  #   end
  #   if params[:word]
  #     @timer2 = Time.now
  #   end
  #   @time_result = @timer2 - @timer1
  # end
