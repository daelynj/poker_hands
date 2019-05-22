require 'poker_hands/hand_rankings/find_three_of_a_kind'
require 'poker_hands/card'
require 'spec_helper'

RSpec.describe PokerHands::FindStraight do
  describe '#call' do
    subject { PokerHands::FindStraight.new.call(hand) }

    let(:hand) do
      [
        PokerHands::Card.new(5, 'D'),
        PokerHands::Card.new(6, 'H'),
        PokerHands::Card.new(7, 'S'),
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(3, 'S')
      ]
    end
    let(:high_card) { hand[2] }

    it 'returns the expected cards in the hand' do
      expect(subject.cards).to be(hand)
    end

    it 'returns the expected high card in the hand' do
      expect(subject.high_card).to be(high_card)
    end

    context 'when hand is a straight' do
      let(:hand) do
        [
          PokerHands::Card.new(5, 'D'),
          PokerHands::Card.new(6, 'H'),
          PokerHands::Card.new(7, 'S'),
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(3, 'S')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::Straight) }
    end

    context 'when hand is a wheel straight' do
      let(:hand) do
        [
          PokerHands::Card.new(14, 'D'),
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(4, 'S'),
          PokerHands::Card.new(3, 'H'),
          PokerHands::Card.new(5, 'S')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::Straight) }
    end

    context 'when hand is not a straight' do
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
