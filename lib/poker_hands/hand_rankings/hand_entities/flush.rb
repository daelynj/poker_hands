module PokerHands
  module Entities
    class Flush
      include Comparable
      attr_reader :flush, :strength

      def initialize(flush:)
        @flush = flush
        @strength = 6
      end
    end
  end
end
