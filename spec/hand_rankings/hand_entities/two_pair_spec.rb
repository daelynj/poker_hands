require 'poker_hands/hand_rankings/hand_entities/pair'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::TwoPair do
  context 'a TwoPair entity' do
    subject do 
      PokerHands::Entities::TwoPair.new(
        cards: hand,
        pairs: pair_cards,
        other_card: other_card
      )
    end
    
    let(:pair_cards) do
      [
        PokerHands::Card.new(11, 'D'),
        PokerHands::Card.new(2, 'C'),
        PokerHands::Card.new(2, 'H'), 
        PokerHands::Card.new(11, 'S')
      ]
    end
    let(:other_card) do
      [
        PokerHands::Card.new(4, 'H')
      ]
    end
    let(:hand) { pair_cards + other_card }

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it 'returns the expected pairs' do
      expect(subject.pairs).to be(pair_cards)
    end

    it 'returns the expected other card' do
      expect(subject.other_card).to be(other_card)
    end

    it "is type 'two pair'" do
      expect(subject.type).to eq('two pair')
    end

    it 'has strength 3' do
      expect(subject.strength).to be 3
    end
  end

  describe '#<=>' do
    context 'hand 1 wins with better pairs' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(4, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:two_pair_hand_1) { pair_cards_1 + other_card_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(3, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(3, 'C')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:two_pair_hand_2) { pair_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_1, 
          pairs: pair_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_2,
          pairs: pair_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'hand 2 wins with better pairs' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(5, 'D'), 
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(5, 'S'),
          PokerHands::Card.new(4, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:two_pair_hand_1) { pair_cards_1 + other_card_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(6, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(6, 'C')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:two_pair_hand_2) { pair_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_1, 
          pairs: pair_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_2,
          pairs: pair_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end

    context 'one same pair but hand 1 has better second pair' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:two_pair_hand_1) { pair_cards_1 + other_card_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(9, 'S'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:two_pair_hand_2) { pair_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_1, 
          pairs: pair_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_2,
          pairs: pair_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'one same pair but hand 2 has better second pair' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(9, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:two_pair_hand_1) { pair_cards_1 + other_card_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:two_pair_hand_2) { pair_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_1, 
          pairs: pair_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_2,
          pairs: pair_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end

    context 'both same pairs but hand 1 has better 5th card' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:two_pair_hand_1) { pair_cards_1 + other_card_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(10, 'D')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:two_pair_hand_2) { pair_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_1, 
          pairs: pair_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_2,
          pairs: pair_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'both same pairs but hand 2 has better 5th card' do
      let(:pair_cards_1) do
        [
          PokerHands::Card.new(11, 'D'), 
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(2, 'H')
        ]
      end
      let(:two_pair_hand_1) { pair_cards_1 + other_card_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(10, 'D')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:two_pair_hand_2) { pair_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_1, 
          pairs: pair_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_2,
          pairs: pair_cards_2,
          other_card: other_card_2
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
          PokerHands::Card.new(10, 'H'),
          PokerHands::Card.new(11, 'S'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:other_card_1) do
        [
          PokerHands::Card.new(9, 'D')
        ]
      end
      let(:two_pair_hand_1) { pair_cards_1 + other_card_1 }

      let(:pair_cards_2) do
        [
          PokerHands::Card.new(11, 'H'), 
          PokerHands::Card.new(10, 'S'),
          PokerHands::Card.new(11, 'D'),
          PokerHands::Card.new(10, 'D')
        ]
      end
      let(:other_card_2) do
        [
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:two_pair_hand_2) { pair_cards_2 + other_card_2 }

      let(:hand_1) do 
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_1, 
          pairs: pair_cards_1, 
          other_card: other_card_1
        )
      end
      let(:hand_2) do
        PokerHands::Entities::TwoPair.new(
          cards: two_pair_hand_2,
          pairs: pair_cards_2,
          other_card: other_card_2
        )
      end

      it 'returns a tie' do
        expect(hand_1 <=> hand_2).to eq('tie')
      end
    end
  end
end
