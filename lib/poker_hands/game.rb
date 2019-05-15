require_relative 'deck'
require_relative 'compare_hands'

module PokerHands
  class Game
    def initialize
      deck = Deck.new

      @hand1 = deck.draw(5)
      @hand2 = deck.draw(5)

      CompareHands.new.call(@hand1, @hand2)
    end
  end
end
