module PokerHands
  class Flush
    def check(hand)
      hand.all? { |card| card.suit == hand.first.suit}
    end
  end
end
