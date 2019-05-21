module PokerHands
  module Entities
    class Straight
      include Comparable
      attr_reader :cards, :high_card, :strength, :type

      def initialize(cards:, high_card:)
        @type = 'straight'
        @cards = cards
        @high_card = high_card
        @strength = 5
      end
      
      def <=>(other_hand)
        high_card = @high_card.rank
        other_hand_high_card = other_hand.high_card.rank

        if (high_card <=> other_hand_high_card) != 0
          return high_card <=> other_hand_high_card
        else
          return 'tie'
        end
      end
    end
  end
end
