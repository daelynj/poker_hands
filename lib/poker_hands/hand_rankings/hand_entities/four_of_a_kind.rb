module PokerHands
  module Entities
    class FourOfAKind
      include Comparable
      attr_reader :foak, :other_card, :strength

      def initialize(foak:, other_card:)
        @foak = foak
        @other_card = other_card
        @strength = 8
      end
    end
  end
end
