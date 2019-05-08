class Game
  def initialize
    deck = Deck.new

    hand1 = deck.draw(5)
    hand2 = deck.draw(5)
  end
end
