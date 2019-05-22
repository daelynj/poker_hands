require 'poker_hands/hand_rankings/hand_entities/full_house'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::FullHouse do
  context 'a FullHouse entity' do
    subject do 
      PokerHands::Entities::FullHouse.new(
        cards: hand,
        set: set_cards,
        pair: pair_cards
      )
    end

    let(:set_cards) do
      [
        PokerHands::Card.new(11, 'D'),
        PokerHands::Card.new(11, 'C'),
        PokerHands::Card.new(11, 'S')
      ]
    end
    let(:pair_cards) do
      [
        PokerHands::Card.new(2, 'H'),
        PokerHands::Card.new(2, 'C')
      ]
    end
    let(:hand) { set_cards + pair_cards }

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it 'returns the expected set' do
      expect(subject.set).to be(set_cards)
    end

    it 'returns the expected pair' do
      expect(subject.pair).to be(pair_cards)
    end

    it "is type 'full house'" do
      expect(subject.type).to eq('full house')
    end

    it 'has strength 7' do
      expect(subject.strength).to be 7
    end
  end

  describe '#<=>' do
    context 'hand 1 wins with a better set' do
      let(:set_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(11, 'S'),
        ]
      end
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(4, 'H')
        ]
      end
      let(:full_house_hand_1) { set_cards_1 + pair_cards_1 }

      let(:set_cards_2) do
        [
          PokerHands::Card.new(10, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:pair_cards_2) do
        [
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(2, 'C')
        ]
      end
      let(:full_house_hand_2) { set_cards_2 + pair_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::FullHouse.new(
          cards: full_house_hand_1, 
          set: set_cards_1, 
          pair: pair_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::FullHouse.new(
          cards: full_house_hand_2,
          set: set_cards_2,
          pair: pair_cards_2
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
          PokerHands::Card.new(10, 'S'),
        ]
      end
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(4, 'H')
        ]
      end
      let(:full_house_hand_1) { set_cards_1 + pair_cards_1 }

      let(:set_cards_2) do
        [
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(11, 'C')
        ]
      end
      let(:pair_cards_2) do
        [
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(2, 'C')
        ]
      end
      let(:full_house_hand_2) { set_cards_2 + pair_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::FullHouse.new(
          cards: full_house_hand_1, 
          set: set_cards_1, 
          pair: pair_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::FullHouse.new(
          cards: full_house_hand_2,
          set: set_cards_2,
          pair: pair_cards_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end
  end
end
