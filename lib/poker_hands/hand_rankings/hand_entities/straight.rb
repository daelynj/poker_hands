module PokerHands
  module Entities
    class Straight
      include Comparable
      attr_reader :cards, :strength, :type

      def initialize(cards:)
        @type = 'straight'
        @cards = cards
        @strength = 5
      end
      
      def <=>(other_hand)
        cards = @cards.map(&:rank).reverse
        other_hand_cards = other_hand.cards.map(&:rank).reverse

        if (cards <=> other_hand_cards) != 0
          return cards <=> other_hand_cards
        else
          return 'tie'
        end
      end
    end
  end
end
