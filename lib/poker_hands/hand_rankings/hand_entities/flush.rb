module PokerHands
  module Entities
    class Flush
      include Comparable
      attr_reader :flush, :strength, :type

      def initialize(flush:)
        @type = 'flush'
        @flush = flush.map(&:rank).sort.reverse
        @strength = 6
      end

      def <=>(other_hand)
        if (@flush <=> other_hand.flush) != 0
          return @flush <=> other_hand.flush
        else
          return 'tie'
        end
      end
    end
  end
end
