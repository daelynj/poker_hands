class RoyalFlush
  def check(hand)
    royal_flush_ranks = ['A', 'K', 'Q', 'J', '10']
    ranks_in_hand = []
    
    return false if hand.any? { |card| card.suit != hand.first.suit}

    hand.size.times do |card|
      ranks_in_hand << hand[card].rank
    end

    (royal_flush_ranks - ranks_in_hand).empty? ? true : false
  end
end
