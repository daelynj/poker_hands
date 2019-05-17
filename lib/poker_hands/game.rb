require 'poker_hands/deck'
require 'poker_hands/compare_hands'

module PokerHands
  class Game
    def initialize
      deck = Deck.new

      @hand1 = deck.draw(5)
      @hand2 = deck.draw(5)

      winning_message = CompareHands.new.call(@hand1, @hand2)
      
      puts "Hand 1: [#{@hand1.join(', ')}]"
      puts "Hand 2: [#{@hand2.join(', ')}]"
      puts "\n#{winning_message}"
    end
  end
end
