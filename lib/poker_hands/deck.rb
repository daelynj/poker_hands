require_relative 'card'

class Deck
  def initialize
    @ranks = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    @suits = ['C', 'H', 'S', 'D']
    @cards = []

    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def draw(card_count)
    @cards.pop(card_count)
  end
end
