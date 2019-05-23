require 'poker_hands/card'

module PokerHands
  class BuildCards
    def call
      ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
      suits = ['C', 'H', 'S', 'D']
      cards = []

      ranks.each do |rank|
        suits.each do |suit|
          cards << Card.new(rank, suit)
        end
      end
      return cards
    end
  end
end
