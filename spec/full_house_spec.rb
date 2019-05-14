require_relative '../lib/poker_hands/hand_rankings/full_house'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::FullHouse do
  describe '.check' do
    subject { PokerHands::FullHouse.new.check(hand) }

    context 'when hand is a FullHouse' do
      let(:hand) do
        [
          PokerHands::Card.new('10', 'H'),
          PokerHands::Card.new('10', 'D'),
          PokerHands::Card.new('10', 'S'),
          PokerHands::Card.new('9', 'C'),
          PokerHands::Card.new('9', 'D')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a FullHouse' do
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
