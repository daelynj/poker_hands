require 'poker_hands/hand_rankings/hand_entities/straight'

module PokerHands
  class FindStraight
    def call(hand)
      hand.sort_by! { |card| card.rank }

      if hand[-1].rank == 14 && hand[-2].rank == 5
        wheel = hand.clone
        wheel.pop

        high_card = wheel.last

        if wheel.each_cons(2).all? { |card, next_card| next_card.rank == card.rank + 1 }
          return Entities::Straight.new(cards: hand, high_card: high_card)
        end
      end

      if !hand.each_cons(2).all? { |card, next_card| next_card.rank == card.rank + 1 }
        return nil
      end

      high_card = hand.last
      
      Entities::Straight.new(cards: hand, high_card: high_card)
    end
  end
end
