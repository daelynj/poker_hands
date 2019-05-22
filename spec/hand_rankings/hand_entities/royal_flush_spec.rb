require 'poker_hands/hand_rankings/hand_entities/royal_flush'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::RoyalFlush do
  context 'a RoyalFlush entity' do
    subject { PokerHands::Entities::RoyalFlush.new(cards: hand) }
    let(:hand) do
      [
        PokerHands::Card.new(10, 'H'),
        PokerHands::Card.new(11, 'H'),
        PokerHands::Card.new(12, 'H'),
        PokerHands::Card.new(14, 'H'),
        PokerHands::Card.new(13, 'H')
      ]
    end

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it 'has strength 10' do
      expect(subject.strength).to be 10
    end
  end

  describe '#<=>' do
    context 'the hands are a tie' do
      let(:royal_flush_1) do
        [
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(12, 'H'),
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(14, 'H'),
          PokerHands::Card.new(13, 'H')
        ]
      end
      let(:royal_flush_2) do
        [
          PokerHands::Card.new(12, 'C'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(13, 'C'),
          PokerHands::Card.new(14, 'C'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:hand_1) { PokerHands::Entities::RoyalFlush.new(cards: royal_flush_1) }
      let(:hand_2) { PokerHands::Entities::RoyalFlush.new(cards: royal_flush_2) }

      it 'returns a tie' do
        expect(hand_1 <=> hand_2).to eq('tie')
      end
    end
  end
end
