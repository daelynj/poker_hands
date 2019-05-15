require_relative 'poker_hands/version'
require_relative 'poker_hands/game'

module PokerHands
  class << self
    def play_game
      game = Game.new
    end
  end
end
