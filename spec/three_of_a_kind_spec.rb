require_relative '../lib/poker_hands/hand_rankings/three_of_a_kind'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::ThreeOfAKind do
  describe '.check' do
    subject { PokerHands::ThreeOfAKind.new.check(hand) }

    context 'when hand is a ThreeOfAKind' do
      let(:hand) do
        [
          PokerHands::Card.new('7', 'C'),
          PokerHands::Card.new('7', 'D'),
          PokerHands::Card.new('7', 'S'),
          PokerHands::Card.new('13', 'C'),
          PokerHands::Card.new('3', 'D')
        ]
      end

      it { is_expected.to be true }
    end

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

    context 'when hand is not a ThreeOfAKind' do
      let(:hand) do
        [
          PokerHands::Card.new('4', 'S'), 
          PokerHands::Card.new('11', 'S'),
          PokerHands::Card.new('8', 'S'),
          PokerHands::Card.new('2', 'S'),
          PokerHands::Card.new('9', 'S')
        ]
      end

      it { is_expected.to be false }
    end
  end
end
