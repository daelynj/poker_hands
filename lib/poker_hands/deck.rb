require 'poker_hands/build_cards'

module PokerHands
  class Deck
    attr_reader :cards

    def initialize
      @cards = BuildCards.new.call()
    end

    def draw(card_count)
      @cards.pop(card_count)
    end
  end
end
