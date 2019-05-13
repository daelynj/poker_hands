class Straight
  def check(hand)
    return false if hand.all? { |card| card.suit == hand.first.suit}
    hand.sort_by! { |card| card.rank.to_i }

    hand.each_cons(2).all? { |card, next_card| next_card.rank.to_i == card.rank.to_i + 1 }
  end
end
