class TwoPair
  def check(hand)
    ranks_in_hand = hand.map(&:rank)

    ranks_in_hand.uniq.count { |rank| ranks_in_hand.count(rank) > 1 } == 2
  end
end
