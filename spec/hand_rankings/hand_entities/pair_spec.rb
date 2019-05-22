require 'poker_hands/hand_rankings/hand_entities/pair'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::Pair do
  context 'a Pair entity' do
    subject do 
      PokerHands::Entities::Pair.new(
        cards: hand,
        pair: pair_cards,
        other_cards: other_cards
      )
    end
    
    let(:pair_cards) do
      [
        PokerHands::Card.new(11, 'D'), 
        PokerHands::Card.new(11, 'S')
      ]
    end
    let(:other_cards) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(2, 'C'),
        PokerHands::Card.new(9, 'H')
      ]
    end
    let(:hand) { pair_cards + other_cards }

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it "is type 'pair'" do
      expect(subject.type).to eq('pair')
    end

    it 'returns the expected pair' do
      expect(subject.pair).to be(pair_cards)
    end

    it 'returns the expected other cards' do
      expect(subject.other_cards).to be(other_cards)
    end

    it 'has strength 2' do
      expect(subject.strength).to be 2
    end
  end

  describe '#<=>' do
    context 'hand 1 wins with a better pair' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:pair_hand_1) { pair_cards_1 + other_cards_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(10, 'D'), 
          PokerHands::Card.new(10, 'S')
        ]
      end
      let(:other_cards_2) do
        [
          PokerHands::Card.new(3, 'H'),
          PokerHands::Card.new(7, 'C'),
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:pair_hand_2) { pair_cards_2 + other_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::Pair.new(
          cards: pair_hand_1, 
          pair: pair_cards_1, 
          other_cards: other_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Pair.new(
          cards: pair_hand_2,
          pair: pair_cards_2,
          other_cards: other_cards_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'hand 2 wins with a better pair' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards_1) do
        [
          PokerHands::Card.new(7, 'H'),
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(3, 'H')
        ]
      end
      let(:pair_hand_1) { pair_cards_1 + other_cards_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(13, 'D'), 
          PokerHands::Card.new(13, 'S')
        ]
      end
      let(:other_cards_2) do
        [
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:pair_hand_2) { pair_cards_2 + other_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::Pair.new(
          cards: pair_hand_1, 
          pair: pair_cards_1, 
          other_cards: other_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Pair.new(
          cards: pair_hand_2,
          pair: pair_cards_2,
          other_cards: other_cards_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end

    context 'same pair but hand 1 has better cards' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards_1) do
        [
          PokerHands::Card.new(6, 'H'),
          PokerHands::Card.new(3, 'C'),
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:pair_hand_1) { pair_cards_1 + other_cards_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'C'), 
          PokerHands::Card.new(11, 'H')
        ]
      end
      let(:other_cards_2) do
        [
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(5, 'D'),
          PokerHands::Card.new(4, 'S')
        ]
      end
      let(:pair_hand_2) { pair_cards_2 + other_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::Pair.new(
          cards: pair_hand_1, 
          pair: pair_cards_1, 
          other_cards: other_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Pair.new(
          cards: pair_hand_2,
          pair: pair_cards_2,
          other_cards: other_cards_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'same pair but hand 2 has better cards' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards_1) do
        [
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(5, 'C'),
          PokerHands::Card.new(3, 'H')
        ]
      end
      let(:pair_hand_1) { pair_cards_1 + other_cards_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'C'), 
          PokerHands::Card.new(11, 'H')
        ]
      end
      let(:other_cards_2) do
        [
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(5, 'D'),
          PokerHands::Card.new(4, 'S')
        ]
      end
      let(:pair_hand_2) { pair_cards_2 + other_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::Pair.new(
          cards: pair_hand_1, 
          pair: pair_cards_1, 
          other_cards: other_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Pair.new(
          cards: pair_hand_2,
          pair: pair_cards_2,
          other_cards: other_cards_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end

    context 'the hands are a tie' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(11, 'S')
        ]
      end
      let(:other_cards_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:pair_hand_1) { pair_cards_1 + other_cards_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'C'), 
          PokerHands::Card.new(11, 'H')
        ]
      end
      let(:other_cards_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(2, 'D'),
          PokerHands::Card.new(9, 'S')
        ]
      end
      let(:pair_hand_2) { pair_cards_2 + other_cards_2 }

      let(:hand_1) do 
        PokerHands::Entities::Pair.new(
          cards: pair_hand_1, 
          pair: pair_cards_1, 
          other_cards: other_cards_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::Pair.new(
          cards: pair_hand_2,
          pair: pair_cards_2,
          other_cards: other_cards_2
        )
      end

      it 'returns a tie' do
        expect(hand_1 <=> hand_2).to eq('tie')
      end
    end
  end
end
