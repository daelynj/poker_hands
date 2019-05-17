require 'poker_hands/hand_rankings/find_three_of_a_kind'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::FindThreeOfAKind do
  describe '#call' do
    subject { PokerHands::FindThreeOfAKind.new.call(hand) }

    context 'when hand is a three of a kind' do
      let(:set_cards) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(11, 'S')
        ]
      end

      let(:other_cards) do
        [
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'H')
        ]
      end

      let(:hand) { set_cards + other_cards }

      it { is_expected.to be_an_instance_of(PokerHands::Entities::ThreeOfAKind) }

      it 'returns the expected cards in the hand' do
        expect(subject.cards).to be(hand)
      end

      it 'returns the expected cards in the three of a kind' do
        expect(subject.set).to match_array(set_cards)
      end

      it 'returns the expected cards in the other cards' do
        expect(subject.other_cards).to match_array(other_cards)
      end

      context 'when hand is not a three of a kind' do
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
