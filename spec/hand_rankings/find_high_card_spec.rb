require 'poker_hands/hand_rankings/find_high_card'
require 'poker_hands/card'
require 'spec_helper'

RSpec.describe PokerHands::FindHighCard do
  describe '#call' do
    subject { PokerHands::FindHighCard.new.call(hand) }

    context 'when hand is a HighCard' do
      let(:hand) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(8, 'D'),
          PokerHands::Card.new(2, 'S'),
          PokerHands::Card.new(9, 'C')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::HighCard) }

      it 'returns the expected cards in the high card' do
        expect(subject.cards).to be(hand)
      end
    end
  end
end
