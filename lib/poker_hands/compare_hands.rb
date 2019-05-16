require_relative 'classify_hand'

module PokerHands
  class CompareHands
    def call(hand1, hand2)
      @hand1 = hand1
      @hand2 = hand2

      hand1 = ClassifyHand.new.call(@hand1)
      hand2 = ClassifyHand.new.call(@hand2)

      determine_winner(hand1, hand2)
    end

    def determine_winner(hand1, hand2)
      if hand1.strength > hand2.strength
        return 'hand 1 wins'
      elsif hand1.strength < hand2.strength
        return 'hand 2 wins'
      else
        return tie(hand1, hand2)
      end
    end

    def tie(hand1, hand2)
      if (hand1 <=> hand2) == 1
        return 'hand 1 wins'
      elsif (hand1 <=> hand2) == -1
        return 'hand 2 wins'
      else
        return 'tie'
      end
    end
  end
end

#test hands
=begin
      @hand1 =
      [
        Card.new('14', 'H'),
        Card.new('13', 'D'),
        Card.new('12', 'C'),
        Card.new('11', 'S'),
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
=end
