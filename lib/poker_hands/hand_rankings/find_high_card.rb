require 'poker_hands/hand_rankings/hand_entities/high_card'

module PokerHands
  class FindHighCard
    def call(hand)
      Entities::HighCard.new(cards: hand)
    end
  end
end
