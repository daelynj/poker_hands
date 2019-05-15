require_relative 'FindFlush'
require_relative 'hand_entities/straight_flush'

module PokerHands
  class FindStraightFlush
    def call(hand)
      if FindFlush.new.call(hand).nil?
        return nil
      end

      Entities::StraightFlush.new(hand)
    end
  end
end
