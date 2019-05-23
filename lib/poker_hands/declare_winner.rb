module PokerHands
  class DeclareWinner
    def call(hand1, hand2, winner)
      puts "Hand 1: [#{hand1.join(', ')}]"
      puts "Hand 2: [#{hand2.join(', ')}]"
      puts "\n#{winner}"
    end
  end
end
