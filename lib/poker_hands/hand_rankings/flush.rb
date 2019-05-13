class Flush
  def check(hand)
    return false if hand.any? { |card| card.suit != hand.first.suit}
  end
end
