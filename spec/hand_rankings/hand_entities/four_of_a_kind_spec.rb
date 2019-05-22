require 'poker_hands/hand_rankings/hand_entities/four_of_a_kind'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::FourOfAKind do
  context 'a FourOfAKind entity' do
    subject do 
      PokerHands::Entities::FourOfAKind.new(
        cards: hand,
        quads: quads_cards,
        other_card: other_card
      )
    end

    let(:quads_cards) do
      [
        PokerHands::Card.new(11, 'D'),
        PokerHands::Card.new(11, 'C'),
        PokerHands::Card.new(11, 'H'), 
        PokerHands::Card.new(11, 'S')
      ]
    end
    let(:other_card) do
      [
        PokerHands::Card.new(4, 'H')
      ]
    end
    let(:hand) { quads_cards + other_card }

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it 'returns the expected quads' do
      expect(subject.quads).to be(quads_cards)
    end

    it 'returns the expected other card' do
      expect(subject.other_card).to be(other_card)
    end

    it "is type 'four of a kind'" do
      expect(subject.type).to eq('four of a kind')
    end

    it 'has strength 8' do
      expect(subject.strength).to be 8
    end
  end

  describe '#<=>' do
    context 'hand 1 wins with better quads' do
      let(:quads_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(11, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:four_of_a_kind_hand_1) { quads_cards_1 + other_card_1 }

      let(:quads_cards_2) do
        [
          PokerHands::Card.new(10, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:four_of_a_kind_hand_2) { quads_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::FourOfAKind.new(
          cards: four_of_a_kind_hand_1, 
          quads: quads_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::FourOfAKind.new(
          cards: four_of_a_kind_hand_2,
          quads: quads_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'hand 2 wins with better quads' do
      let(:quads_cards_1) do
        [
          PokerHands::Card.new(10, 'D'), 
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:four_of_a_kind_hand_1) { quads_cards_1 + other_card_1 }

      let(:quads_cards_2) do
        [
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(11, 'C')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:four_of_a_kind_hand_2) { quads_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::FourOfAKind.new(
          cards: four_of_a_kind_hand_1, 
          quads: quads_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::FourOfAKind.new(
          cards: four_of_a_kind_hand_2,
          quads: quads_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end
  end
end
