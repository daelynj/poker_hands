class Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    @rank + @suit
  end
end
