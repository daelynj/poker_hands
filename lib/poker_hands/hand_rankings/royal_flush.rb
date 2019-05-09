class RoyalFlush
  def check(hand)
    royal_flush_ranks = ['A', 'K', 'Q', 'J', '10']
    
    return false if hand.any? { |card| card.suit != hand.first.suit}

    ranks_in_hand = hand.map(&:rank)
    #hand.each do |card|
    #  ranks_in_hand << card.rank
    #end

    (royal_flush_ranks - ranks_in_hand).empty? ? true : false
  end
end
