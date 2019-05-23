require 'poker_hands/deck'
require 'poker_hands/compare_hands'

module PokerHands
  class Game
    def initialize

      deck = Deck.new
      shuffled_deck = deck.shuffle

      hand1 = shuffled_deck.draw(5)
      hand2 = shuffled_deck.draw(5)

      winning_message = CompareHands.new.call(hand1, hand2)
      
      puts "Hand 1: [#{hand1.join(', ')}]"
      puts "Hand 2: [#{hand2.join(', ')}]"
      puts "\n#{winning_message}"
    end
  end
end
