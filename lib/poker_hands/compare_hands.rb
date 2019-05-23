require 'poker_hands/classify_hand'
require 'poker_hands/declare_winner'

module PokerHands
  class CompareHands
    def call(hand1, hand2)
      @hand1 = ClassifyHand.new.call(hand1)
      @hand2 = ClassifyHand.new.call(hand2)

      @hand_types = "Hand 1 is a #{@hand1.type}. Hand 2 is a #{@hand2.type}."

      determine_winner()
    end

    def determine_winner
      if @hand1.strength > @hand2.strength
        return "#{@hand_types} Hand 1 wins."
      elsif @hand1.strength < @hand2.strength
        return "#{@hand_types} Hand 2 wins."
      else
        return tie()
      end
    end

    def tie
      if (@hand1 <=> @hand2) == 1
        return "#{@hand_types} Hand 1 wins."
      elsif (@hand1 <=> @hand2) == -1
        return "#{@hand_types} Hand 2 wins."
      else
        return "#{@hand_types} Tie."
      end
    end
  end
end
