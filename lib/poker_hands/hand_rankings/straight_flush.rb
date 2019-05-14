require_relative 'flush'
require_relative 'straight'
module PokerHands
  class StraightFlush
    def check(hand)
      Flush.new.check(hand) && Straight.new.check(hand)
    end
  end
end
