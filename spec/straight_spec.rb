require_relative '../lib/poker_hands/hand_rankings/straight'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::Straight do
  describe '.check' do
    subject { PokerHands::Straight.new.check(hand) }

    context 'when hand is a Straight' do
      let(:hand) do
        [
          PokerHands::Card.new('9', 'C'),
          PokerHands::Card.new('8', 'D'),
          PokerHands::Card.new('7', 'S'),
          PokerHands::Card.new('6', 'D'),
          PokerHands::Card.new('5', 'H')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a Straight' do
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
