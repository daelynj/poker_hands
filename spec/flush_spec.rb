require_relative '../lib/poker_hands/hand_rankings/flush'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::Flush do
  describe '#check' do
    subject { PokerHands::Flush.new.check(hand) }

    context 'when hand is a Flush' do
      let(:hand) do
        [
          PokerHands::Card.new('4', 'S'),
          PokerHands::Card.new('11', 'S'),
          PokerHands::Card.new('8', 'S'),
          PokerHands::Card.new('2', 'S'),
          PokerHands::Card.new('9', 'S')
        ]
      end

      it { is_expected.to be true }
    end

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

    context 'when hand is not a Flush' do
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
