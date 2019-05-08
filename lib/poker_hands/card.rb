class Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def get_card
    @rank + @suit
  end
end