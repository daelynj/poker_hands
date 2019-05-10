class FourOfAKind
  def check(hand)
    hand.sort_by! { |card| card.rank.to_i }
    
    hand.each_cons(4).any? { |card| card.uniq { |card| card.rank}.length == 1 }
  end
end
