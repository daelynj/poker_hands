class TwoPair
  def check(hand)
    ranks_in_hand = hand.map(&:rank)

    pairs = ranks_in_hand.find_all { |rank| ranks_in_hand.count(rank) > 1 }

    pairs.length > 2
  end
end
