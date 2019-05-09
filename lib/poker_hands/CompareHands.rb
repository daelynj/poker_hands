require_relative 'value'

class CompareHands
  def call(hand1, hand2)
    h1_val = retreive_value(hand1)
    h2_val = retreive_value(hand2)
  end

  def retreive_value(hand)
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
    value.max
  end
end
