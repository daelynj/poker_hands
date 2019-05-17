require_relative '../../lib/poker_hands/hand_rankings/find_pair'
require_relative '../../lib/poker_hands/card'
require 'pry'

RSpec.describe PokerHands::FindPair do
  describe '#call' do
    subject { PokerHands::FindPair.new.call(hand) }

    context 'when hand is a Pair' do
      let(:pair_cards) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:hand) { pair_cards + other_cards }

      it { is_expected.to be_an_instance_of(PokerHands::Entities::Pair) }

      it 'returns the expected cards in the hand' do
        expect(subject.cards).to be(hand)
      end

      it 'returns the expected cards in the pair' do
        expect(subject.pair).to match_array(pair_cards)
      end

      it 'returns the expected cards in the other cards' do
        expect(subject.other_cards).to match_array(other_cards)
      end

      context 'when hand is not a Pair' do
        let(:hand) do
          [
            PokerHands::Card.new(4, 'H'),
            PokerHands::Card.new(11, 'S'),
            PokerHands::Card.new(8, 'S'),
            PokerHands::Card.new(2, 'D'),
            PokerHands::Card.new(9, 'S')
          ]
        end

        it { is_expected.to be_nil }
      end
    end
  end
end
