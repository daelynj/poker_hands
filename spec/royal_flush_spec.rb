require_relative '../lib/poker_hands/hand_rankings/royal_flush'
require_relative '../lib/poker_hands/card'

RSpec.describe PokerHands::RoyalFlush do
  describe '.check' do
    subject { PokerHands::RoyalFlush.new.check(hand) }

    context 'when hand is a RoyalFlush' do
      let(:hand) do
        [
          PokerHands::Card.new('14', 'D'),
          PokerHands::Card.new('13', 'D'),
          PokerHands::Card.new('12', 'D'),
          PokerHands::Card.new('11', 'D'),
          PokerHands::Card.new('10', 'D')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a RoyalFlush' do
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
