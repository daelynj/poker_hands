require_relative 'hand_entities/high_card'

module PokerHands
  class FindHighCard
    def call(hand)
      hand.sort! { |card| card.rank.to_i }
      hand.reverse!

      Entities::HighCard.new(cards: hand)
    end
  end
end
