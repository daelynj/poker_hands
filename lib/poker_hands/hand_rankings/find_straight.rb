require_relative 'hand_entities/straight'

module PokerHands
  class FindStraight
    def call(hand)
      hand.sort_by! { |card| card.rank.to_i }

      if !hand.each_cons(2).all? { |card, next_card| next_card.rank.to_i == card.rank.to_i + 1 }
        return nil
      end

      Entities::Straight.new(straight: hand)
    end
  end
end
