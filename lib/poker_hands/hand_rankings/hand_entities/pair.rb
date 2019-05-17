module PokerHands
  module Entities
    class Pair
      include Comparable
      attr_reader :cards, :pair, :other_cards, :strength, :type

      def initialize(cards:, pair:, other_cards:)
        @type = 'pair'
        @cards = cards
        @pair = pair
        @other_cards = other_cards
        @strength = 2
      end

      def <=>(other_hand)
        pair = @pair[0].rank
        other_cards = @other_cards.map(&:rank).sort.reverse

        other_hand_pair = other_hand.pair[0].rank
        other_hand_cards = other_hand.other_cards.map(&:rank).sort.reverse

        if (pair <=> other_hand_pair) != 0
          return pair <=> other_hand_pair
        elsif (other_cards <=> other_hand_cards) != 0
          return other_cards <=> other_hand_cards
        else
          return 'tie'
        end
      end
    end
  end
end
