require 'poker_hands/hand_rankings/hand_entities/three_of_a_kind'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::ThreeOfAKind do
  context 'a ThreeOfAKind entity' do
    subject do 
      PokerHands::Entities::ThreeOfAKind.new(
        cards: hand,
        set: set_cards,
        other_cards: other_cards
      )
    end

    let(:set_cards) do
      [
        PokerHands::Card.new(11, 'D'),
        PokerHands::Card.new(11, 'H'), 
        PokerHands::Card.new(11, 'S')
      ]
    end
    let(:other_cards) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(2, 'C')
      ]
    end
    let(:hand) { set_cards + other_cards }

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it 'returns the expected set' do
      expect(subject.set).to be(set_cards)
    end

    it 'returns the expected other cards' do
      expect(subject.other_cards).to be(other_cards)
    end

    it "is type 'three of a kind'" do
      expect(subject.type).to eq('three of a kind')
    end

    it 'has strength 4' do
      expect(subject.strength).to be 4
    end
  end

  describe '#<=>' do
    context 'hand 1 wins with a better set' do
      let(:set_cards_1) do
        [
          PokerHands::Card.new(11, 'D'),
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(2, 'C')
        ]
      end
      let(:set_hand_1) { set_cards_1 + other_cards_1 }

      let(:set_cards_2) do
        [
          PokerHands::Card.new(10, 'D'),
          PokerHands::Card.new(10, 'H'), 
          PokerHands::Card.new(10, 'S')
        ]
      end
      let(:other_cards_2) do
        [
          PokerHands::Card.new(3, 'H'),
          PokerHands::Card.new(4, 'C')
        ]
      end
      let(:set_hand_2) { set_cards_2 + other_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::ThreeOfAKind.new(
          cards: set_hand_1, 
          set: set_cards_1, 
          other_cards: other_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::ThreeOfAKind.new(
          cards: set_hand_2,
          set: set_cards_2,
          other_cards: other_cards_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'hand 2 wins with a better set' do
      let(:set_cards_1) do
        [
          PokerHands::Card.new(10, 'D'),
          PokerHands::Card.new(10, 'H'), 
          PokerHands::Card.new(10, 'S')
        ]
      end
      let(:other_cards_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(2, 'C')
        ]
      end
      let(:set_hand_1) { set_cards_1 + other_cards_1 }

      let(:set_cards_2) do
        [
          PokerHands::Card.new(11, 'D'),
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards_2) do
        [
          PokerHands::Card.new(3, 'H'),
          PokerHands::Card.new(4, 'C')
        ]
      end
      let(:set_hand_2) { set_cards_2 + other_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::ThreeOfAKind.new(
          cards: set_hand_1, 
          set: set_cards_1, 
          other_cards: other_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::ThreeOfAKind.new(
          cards: set_hand_2,
          set: set_cards_2,
          other_cards: other_cards_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end
  end
end
