require_relative 'deck'
require_relative 'CompareHands'

class Game
  def initialize
    deck = Deck.new

    @hand1 = deck.draw(5)
    @hand2 = deck.draw(5)
  end

  def determine_winner
    CompareHands.new.call(@hand1, @hand2) ? 'Hand 1 wins' : 'Hand 2 wins'
  end
end
