require_relative '../lib/poker_hands/hand_rankings/pair'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::Pair do
  describe '.check' do
    subject { PokerHands::Pair.new.check(hand) }

    context 'when hand is a Pair' do
      let(:hand) do
        [
          PokerHands::Card.new('14', 'H'),
          PokerHands::Card.new('14', 'D'),
          PokerHands::Card.new('8', 'C'),
          PokerHands::Card.new('4', 'S'),
          PokerHands::Card.new('7', 'H')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is a TwoPair' do
      let(:hand) do
        [
          PokerHands::Card.new('4', 'C'),
          PokerHands::Card.new('4', 'S'),
          PokerHands::Card.new('3', 'C'),
          PokerHands::Card.new('3', 'D'),
          PokerHands::Card.new('12', 'C')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a Pair' do
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
