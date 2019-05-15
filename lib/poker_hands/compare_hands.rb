require_relative 'hand_rankings/find_pair'
require_relative 'hand_rankings/find_two_pair'

module PokerHands
  class CompareHands
    def call(hand1, hand2)
      @hand1 =
      [
        Card.new('13', 'H'),
        Card.new('13', 'D'),
        Card.new('12', 'C'),
        Card.new('12', 'S'),
        Card.new('7', 'H')
      ]
      @hand2 =
      [
        Card.new('13', 'H'),
        Card.new('13', 'D'),
        Card.new('8', 'C'),
        Card.new('4', 'S'),
        Card.new('7', 'H')        
      ]

      hand1 = ClassifyHand.new.call(hand1)
      hand2 = ClassifyHand.new.call(hand2)

      #hand1.strength < hand2.strength
      
    end
  end
end
