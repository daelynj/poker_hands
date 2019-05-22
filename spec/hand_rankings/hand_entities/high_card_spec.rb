require 'poker_hands/hand_rankings/hand_entities/high_card'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::HighCard do
  context 'a HighCard entity' do
    subject { PokerHands::Entities::HighCard.new(cards: hand) }
    let(:hand) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(11, 'S'),
        PokerHands::Card.new(8, 'D'),
        PokerHands::Card.new(2, 'S'),
        PokerHands::Card.new(9, 'C')
      ]
    end

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end
    
    it "is type 'high card'" do
      expect(subject.type).to eq('high card')
    end

    it 'has strength 1' do
      expect(subject.strength).to be 1
    end
  end

  describe '#<=>' do
    context 'hand 1 is the winning hand' do
      let(:high_card_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(12, 'S'),
          PokerHands::Card.new(8, 'D'),
          PokerHands::Card.new(2, 'S'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:high_card_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'D'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:hand_1) { PokerHands::Entities::HighCard.new(cards: high_card_1) }
      let(:hand_2) { PokerHands::Entities::HighCard.new(cards: high_card_2) }

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'hand 2 is the winning hand' do
      let(:high_card_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(3, 'S'),
          PokerHands::Card.new(8, 'D'),
          PokerHands::Card.new(2, 'S'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:high_card_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'D'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:hand_1) { PokerHands::Entities::HighCard.new(cards: high_card_1) }
      let(:hand_2) { PokerHands::Entities::HighCard.new(cards: high_card_2) }

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end

    context 'the hands are a tie' do
      let(:high_card_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(12, 'S'),
          PokerHands::Card.new(8, 'D'),
          PokerHands::Card.new(2, 'S'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:high_card_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(12, 'D'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'D'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:hand_1) { PokerHands::Entities::HighCard.new(cards: high_card_1) }
      let(:hand_2) { PokerHands::Entities::HighCard.new(cards: high_card_2) }

      it 'returns a tie' do
        expect(hand_1 <=> hand_2).to eq('tie')
      end
    end
  end
end
