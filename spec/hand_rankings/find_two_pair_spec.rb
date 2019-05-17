require 'poker_hands/hand_rankings/find_two_pair'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::FindTwoPair do
  describe '#call' do
    subject { PokerHands::FindTwoPair.new.call(hand) }

    context 'when hand is a TwoPair' do
      let(:pair_cards) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(4, 'C')
        ]
      end

      let(:other_card) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end

      let(:hand) { pair_cards + other_card }

      it { is_expected.to be_an_instance_of(PokerHands::Entities::TwoPair) }

      it 'returns the expected cards in the hand' do
        expect(subject.cards).to be(hand)
      end

      it 'returns the expected cards in the pair' do
        expect(subject.pairs).to match_array(pair_cards)
      end

      it 'returns the expected cards in the other cards' do
        expect(subject.other_card).to match_array(other_card)
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
