class Pair
  def check(hand)
    ranks_in_hand = hand.map(&:rank)

    ranks_in_hand.uniq.any? do |rank|
      ranks_in_hand.count(rank) == 2
    end
  end
end
