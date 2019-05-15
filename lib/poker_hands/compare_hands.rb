require_relative 'hand_rankings/find_pair'

module PokerHands
  class CompareHands
    def call(hand1, hand2)
      hand1 =
      [
        Card.new('13', 'H'),
        Card.new('13', 'D'),
        Card.new('9', 'C'),
        Card.new('4', 'S'),
        Card.new('7', 'H')
      ]
      hand2 =
      [
        Card.new('13', 'H'),
        Card.new('13', 'D'),
        Card.new('8', 'C'),
        Card.new('4', 'S'),
        Card.new('7', 'H')        
      ]

      result = FindPair.new.call(hand1) <=> FindPair.new.call(hand2)

      if (result) == 1
        puts 'hand 1 wins'
      elsif (result) == -1
        puts 'hand 2 wins'
      else
        puts 'hands are equal'
      end
    end
  end
end

=begin
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
=end
