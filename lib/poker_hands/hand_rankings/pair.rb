class Pair
  def check(hand)
    hand.sort_by! { |card| card.rank.to_i }

    ranks_in_hand = hand.map(&:rank)

    ranks_in_hand.uniq.any? do |rank|
      ranks_in_hand.count(rank) == 2
    end
  end
end
