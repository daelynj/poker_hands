module PokerHands
  class Card

    attr_reader :rank
    attr_reader :suit

    def initialize(rank, suit)
      @rank = rank
      @suit = suit
    end

    def to_s
      @rank.to_s + @suit
    end
  end
end
