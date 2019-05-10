class StraightFlush
  def check(hand)
    return false if hand.any? { |card| card.suit != hand.first.suit}

    hand.sort_by!(&:rank)
  end
end
