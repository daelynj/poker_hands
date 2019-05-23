require 'poker_hands/deck'
require 'poker_hands/compare_hands'

module PokerHands
  class Game
    def initialize

      deck = Deck.new
      
      shuffled_deck = deck.clone
      shuffled_deck.cards.shuffle!

      hand1 = shuffled_deck.draw(5)
      hand2 = shuffled_deck.draw(5)

      DeclareWinner.new.call(hand1, hand2, CompareHands.new.call(hand1, hand2))
    end
  end
end
