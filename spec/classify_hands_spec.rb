require 'poker_hands/hand_rankings/find_three_of_a_kind'
require 'poker_hands/classify_hand'
require 'spec_helper'

RSpec.describe PokerHands::ClassifyHand do
  subject { PokerHands::ClassifyHand.new.call(hand) }

  context 'given a three of a kind poker hand' do
    let(:hand) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(4, 'S'),
        PokerHands::Card.new(8, 'S'),
        PokerHands::Card.new(4, 'D'),
        PokerHands::Card.new(9, 'S')
      ]
    end

    it 'classifies the hand' do
      expect(subject).to be_a(PokerHands::Entities::ThreeOfAKind)
    end
  end
end
