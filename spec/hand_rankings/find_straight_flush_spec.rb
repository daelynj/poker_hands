require 'poker_hands/hand_rankings/find_straight_flush'
require 'poker_hands/card'
require 'spec_helper'

RSpec.describe PokerHands::FindStraightFlush do
  describe '#call' do
    subject { PokerHands::FindStraightFlush.new.call(hand) }
    let(:hand) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(5, 'H'),
        PokerHands::Card.new(8, 'H'),
        PokerHands::Card.new(6, 'H'),
        PokerHands::Card.new(7, 'H')
      ]
    end
    let(:high_card) { hand[2] }

    it 'returns the expected cards in the hand' do
      expect(subject.cards).to be(hand)
    end

    it 'returns the expected high card in the hand' do
      expect(subject.high_card).to be(high_card)
    end

    context 'when hand is a straight flush' do
      let(:hand) do
        [
          PokerHands::Card.new(5, 'D'),
          PokerHands::Card.new(6, 'D'),
          PokerHands::Card.new(7, 'D'),
          PokerHands::Card.new(4, 'D'),
          PokerHands::Card.new(3, 'D')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::StraightFlush) }
    end

    context 'when hand is a wheel straight flush' do
      let(:hand) do
        [
          PokerHands::Card.new(14, 'D'),
          PokerHands::Card.new(2, 'D'),
          PokerHands::Card.new(4, 'D'),
          PokerHands::Card.new(3, 'D'),
          PokerHands::Card.new(5, 'D')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::StraightFlush) }
    end

    context 'when hand is not a straight flush' do
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
