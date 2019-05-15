module PokerHands
  module Entities
    class FullHouse
      include Comparable
      attr_reader :toak, :pair, :strength

      def initialize(toak:, pair:)
        @toak = toak.map(&:rank)
        @pair = pair
        @strength = 7
      end
    end
  end
end
