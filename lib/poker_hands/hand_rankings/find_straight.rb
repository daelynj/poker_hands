require 'poker_hands/hand_rankings/hand_entities/straight'

module PokerHands
  class FindStraight
    def call(hand)
      hand.sort_by! { |card| card.rank }

      if !hand.each_cons(2).all? { |card, next_card| next_card.rank == card.rank + 1 }
        return nil
      end
      
      Entities::Straight.new(cards: hand)
    end
  end
end
