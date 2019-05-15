require_relative 'hand_entities/flush'

module PokerHands
  class FindFlush
    def call(hand)
      if !hand.all? { |card| card.suit == hand.first.suit}
        return nil
      end

      Entities::Flush.new(flush: hand)
    end
  end
end
