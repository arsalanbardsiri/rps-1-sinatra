require "sinatra"
require "sinatra/reloader"

class Game
  POSSIBILITIES = { "rock" => "scissors", "scissors" => "paper", "paper" => "rock" }
  OPTIONS = POSSIBILITIES.keys

  def our_choice(choice)
    OPTIONS.include?(choice) ? choice : raise(ArgumentError, "Invalid choice")
  end

  def their_choice
    OPTIONS.sample
  end

  def evaluate(choice_one, choice_two)
    return "We tied!" if choice_one == choice_two
    POSSIBILITIES[choice_one] == choice_two ? "We won!" : "We lost!"
  end
end

the_game = Game.new

get("/") do
  erb :home
end

get("/rock") do
  @us     = the_game.our_choice("rock")
  @them   = the_game.their_choice
  @result = the_game.evaluate(@us, @them)
  erb :rock
end

get("/paper") do
  @us     = the_game.our_choice("paper")
  @them   = the_game.their_choice
  @result = the_game.evaluate(@us, @them)
  erb :paper
end

get("/scissors") do
  @us     = the_game.our_choice("scissors")
  @them   = the_game.their_choice
  @result = the_game.evaluate(@us, @them)
  erb :scissors
end
