require 'poker_hands/hand_rankings/find_full_house'
require 'poker_hands/card'
require 'spec_helper'

RSpec.describe PokerHands::FindFullHouse do
  describe '#call' do
    subject { PokerHands::FindFullHouse.new.call(hand) }

    context 'when hand is a full house' do
      let(:set_cards) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(11, 'S')
        ]
      end

      let(:pair_cards) do
        [
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(2, 'H')
        ]
      end

      let(:hand) { set_cards + pair_cards }

      it { is_expected.to be_an_instance_of(PokerHands::Entities::FullHouse) }

      it 'returns the expected cards in the hand' do
        expect(subject.cards).to be(hand)
      end

      context 'when hand is not a full house' do
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
