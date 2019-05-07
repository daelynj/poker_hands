require_relative 'card'

class Deck
  def initialize
    @hand_size = 5
    @hand_size.freeze

    @ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    @suits = ['C', 'H', 'S', 'D']
    @deck = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @deck << Card.new(rank, suit)
      end
    end
    @deck.shuffle!
  end

  def deal
    [].tap do |hand|
      @hand_size.times do
        hand << @deck.shift.to_s
      end
    end
  end
end
