class FourOfAKind
  def check(hand)
    hand.sort_by! { |card| card.rank.to_i }
    #hand.each_cons(4).any? { |card| card.uniq { |card| card.rank}.length == 1 }

    ranks_in_hand = hand.map(&:rank)

    ranks_in_hand.uniq.any? do |rank|
      ranks_in_hand.count(rank) == 4
    end
  end
end
