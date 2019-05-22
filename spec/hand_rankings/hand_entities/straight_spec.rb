require 'poker_hands/hand_rankings/hand_entities/straight'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::Straight do
  context 'a Straight entity' do
    subject do
      PokerHands::Entities::Straight.new(
        cards: hand,
        high_card: high_card
      )
    end
    let(:hand) do
      [
        PokerHands::Card.new(10, 'H'),
        PokerHands::Card.new(11, 'S'),
        PokerHands::Card.new(8, 'D'),
        PokerHands::Card.new(9, 'S'),
        PokerHands::Card.new(7, 'C')
      ]
    end

    let(:high_card) { hand[1] }

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it 'returns the expected high card' do
      expect(subject.high_card).to be(high_card)
    end
    
    it "is type 'straight'" do
      expect(subject.type).to eq('straight')
    end

    it 'has strength 5' do
      expect(subject.strength).to be 5
    end
  end

  describe '#<=>' do
    context 'hand 1 wins with the better straight' do
      let(:straight_1) do
        [
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(8, 'D'),
          PokerHands::Card.new(9, 'S'),
          PokerHands::Card.new(7, 'C')
        ]
      end
      let(:high_card_1) { straight_1[1] }

      let(:straight_2) do
        [
          PokerHands::Card.new(3, 'C'),
          PokerHands::Card.new(5, 'S'),
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(7, 'D'),
          PokerHands::Card.new(6, 'H')
        ]
      end
      let(:high_card_2) { straight_2[3] }

      let(:hand_1) do
        PokerHands::Entities::Straight.new(
          cards: straight_1,
          high_card: high_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Straight.new(
          cards: straight_2,
          high_card: high_card_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end


    context 'hand 2 wins with the better straight' do
      let(:straight_1) do
        [
          PokerHands::Card.new(3, 'C'),
          PokerHands::Card.new(5, 'S'),
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(7, 'D'),
          PokerHands::Card.new(6, 'H')
        ]
      end
      let(:high_card_1) { straight_1[3] }

      let(:straight_2) do
        [
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(8, 'D'),
          PokerHands::Card.new(9, 'S'),
          PokerHands::Card.new(7, 'C')
        ]
      end
      let(:high_card_2) { straight_2[1] }

      let(:hand_1) do
        PokerHands::Entities::Straight.new(
          cards: straight_1,
          high_card: high_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Straight.new(
          cards: straight_2,
          high_card: high_card_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end

    context 'the hands are a tie' do
      let(:straight_1) do
        [
          PokerHands::Card.new(3, 'C'),
          PokerHands::Card.new(5, 'S'),
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(7, 'D'),
          PokerHands::Card.new(6, 'H')
        ]
      end
      let(:high_card_1) { straight_1[3] }

      let(:straight_2) do
        [
          PokerHands::Card.new(3, 'D'),
          PokerHands::Card.new(5, 'H'),
          PokerHands::Card.new(4, 'S'),
          PokerHands::Card.new(7, 'C'),
          PokerHands::Card.new(6, 'D')
        ]
      end
      let(:high_card_2) { straight_2[3] }

      let(:hand_1) do
        PokerHands::Entities::Straight.new(
          cards: straight_1,
          high_card: high_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Straight.new(
          cards: straight_2,
          high_card: high_card_2
        )
      end

      it 'returns a tie' do
        expect(hand_1 <=> hand_2).to eq('tie')
      end
    end
  end
end
