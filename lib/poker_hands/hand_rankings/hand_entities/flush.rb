module PokerHands
  module Entities
    class Flush
      include Comparable
      attr_reader :flush, :strength, :type

      def initialize(flush:)
        @type = 'flush'
        @flush = flush
        @strength = 6
      end

      def <=>(other_hand)
        flush = @flush.map(&:rank).sort.reverse
        other_hand_flush = other_hand.flush.map(&:rank).sort.reverse

        if (flush <=> other_hand_flush) != 0
          return flush <=> other_hand_flush
        else
          return 'tie'
        end
      end
    end
  end
end
