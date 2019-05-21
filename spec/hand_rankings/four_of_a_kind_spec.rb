require 'poker_hands/hand_rankings/find_four_of_a_kind'
require 'poker_hands/card'
require 'spec_helper'

RSpec.describe PokerHands::FindFourOfAKind do
  describe '#call' do
    subject { PokerHands::FindFourOfAKind.new.call(hand) }

    context 'when hand is a four of a kind' do
      let(:quad_cards) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(11, 'C')
        ]
      end

      let(:other_card) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end

      let(:hand) { quad_cards + other_card }

      it { is_expected.to be_an_instance_of(PokerHands::Entities::FourOfAKind) }

      it 'returns the expected cards in the hand' do
        expect(subject.cards).to be(hand)
      end

      context 'when hand is not a four of a kind' do
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
