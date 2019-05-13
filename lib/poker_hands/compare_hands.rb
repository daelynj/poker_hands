require_relative 'value'

module PokerHands
  class CompareHands
    def call(hand1, hand2)
      h1_val = retrieve_value(hand1)
      h2_val = retrieve_value(hand2)

      winner(h1_val, h2_val)
    end

    def retrieve_value(hand)
      value = [
                Value.new.royal_flush?(hand),
                Value.new.straight_flush?(hand),
                Value.new.four_of_a_kind?(hand),
                Value.new.full_house?(hand),
                Value.new.flush?(hand),
                Value.new.straight?(hand),
                Value.new.three_of_a_kind?(hand),
                Value.new.two_pair?(hand),
                Value.new.pair?(hand),
                Value.new.high_card?(hand)
              ]
      value.index(true)
    end
    
    def winner(h1_val, h2_val)
      h1_val < h2_val ? 'h1' : 'h2'
    end
  end
end
