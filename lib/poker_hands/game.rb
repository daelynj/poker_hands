require_relative 'deck'
require_relative 'compare_hands'

module PokerHands
  class Game
    def initialize
      deck = Deck.new

      @hand1 = deck.draw(5)
      @hand2 = deck.draw(5)

      winner = CompareHands.new.call(@hand1, @hand2)
      
      puts "Hand 1: #{@hand1.join(', ')}"
      puts "Hand 2: #{@hand2.join(', ')}"
      puts "\n#{winner}"
    end
  end
end
