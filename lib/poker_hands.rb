require_relative 'poker_hands/version'
require_relative 'poker_hands/game'

module PokerHands
  class << self
    def play_game
      game = Game.new
      puts game.determine_winner
    end
  end
end
