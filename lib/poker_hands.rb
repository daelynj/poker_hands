require_relative 'poker_hands/version'
require_relative 'poker_hands/game'
require_relative 'poker_hands/deck'

module PokerHands
  class << self
    def play_game
      Game.new
    end
  end
end

PokerHands::play_game
