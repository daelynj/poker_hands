require_relative '../lib/poker_hands/hand_rankings/four_of_a_kind'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::FourOfAKind do
  describe '#check' do
    subject { PokerHands::FourOfAKind.new.check(hand) }

    context 'when hand is a FourOfAKind' do
      let(:hand) do
        [
          PokerHands::Card.new('11', 'H'),
          PokerHands::Card.new('11', 'D'),
          PokerHands::Card.new('11', 'S'),
          PokerHands::Card.new('11', 'C'),
          PokerHands::Card.new('7', 'D')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a FourOfAKind' do
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
