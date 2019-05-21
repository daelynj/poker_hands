require 'poker_hands/hand_rankings/find_royal_flush'
require 'poker_hands/card'
require 'spec_helper'

RSpec.describe PokerHands::FindRoyalFlush do
  describe '#call' do
    subject { PokerHands::FindRoyalFlush.new.call(hand) }

    context 'when hand is a royal flush' do
      let(:hand) do
        [
          PokerHands::Card.new(13, 'H'),
          PokerHands::Card.new(14, 'H'),
          PokerHands::Card.new(12, 'H'),
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(11, 'H')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::RoyalFlush) }

      it 'returns the expected cards in the royal flush' do
        expect(subject.cards).to be(hand)
      end

      context 'when hand is not a royal flush' do
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
