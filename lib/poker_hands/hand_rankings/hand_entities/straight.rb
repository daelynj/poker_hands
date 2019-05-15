module PokerHands
  module Entities
    class Straight
      include Comparable
      attr_reader :straight, :strength

      def initialize(straight:)
        @straight = straight.map(&:rank)
        @strength = 5
      end
    end
  end
end
