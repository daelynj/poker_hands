require_relative '../lib/poker_hands/hand_rankings/straight_flush'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::StraightFlush do
  describe '.check' do
    subject { PokerHands::StraightFlush.new.check(hand) }

    context 'when hand is a StraightFlush' do
      let(:hand) do
        [
          PokerHands::Card.new('8', 'C'),
          PokerHands::Card.new('7', 'C'),
          PokerHands::Card.new('6', 'C'),
          PokerHands::Card.new('5', 'C'),
          PokerHands::Card.new('4', 'C')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a StraightFlush' do
      let(:hand) do
        [
          PokerHands::Card.new('7', 'C'),
          PokerHands::Card.new('7', 'D'),
          PokerHands::Card.new('7', 'S'),
          PokerHands::Card.new('13', 'C'),
          PokerHands::Card.new('3', 'D')
        ]
      end

      it { is_expected.to be false }
    end
  end
end
