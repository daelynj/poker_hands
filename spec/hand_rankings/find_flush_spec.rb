require 'poker_hands/hand_rankings/find_flush'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::FindFlush do
  describe '#call' do
    subject { PokerHands::FindFlush.new.call(hand) }

    context 'when hand is a Flush' do
      let(:hand) do
        [
          PokerHands::Card.new(4, 'S'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(8, 'S'),
          PokerHands::Card.new(2, 'S'),
          PokerHands::Card.new(9, 'S')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::Flush) }

      it 'returns the expected cards in the flush' do
        expect(subject.cards).to be(hand)
      end
    end
    
    context 'when hand is not a Flush' do
      let (:hand) do
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
