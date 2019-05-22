require 'poker_hands/hand_rankings/hand_entities/flush'
require 'poker_hands/card'
require 'spec_helper'


RSpec.describe PokerHands::Entities::Flush do
  context 'a Flush entity' do
    subject { PokerHands::Entities::Flush.new(cards: hand) }
    let(:hand) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(11, 'H'),
        PokerHands::Card.new(8, 'H'),
        PokerHands::Card.new(2, 'H'),
        PokerHands::Card.new(9, 'H')
      ]
    end

    it 'returns the expected cards' do
      expect(subject.cards).to be(hand)
    end

    it 'has strength 6' do
      expect(subject.strength).to be 6
    end
  end

  describe '#<=>' do
    context 'hand 1 wins with the better flush' do
      let(:flush_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(12, 'H'),
          PokerHands::Card.new(8, 'H'),
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:flush_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:hand_1) { PokerHands::Entities::Flush.new(cards: flush_1) }
      let(:hand_2) { PokerHands::Entities::Flush.new(cards: flush_2) }

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end

      let(:flush_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(8, 'H'),
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(10, 'H')
        ]
      end
      let(:flush_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:hand_1) { PokerHands::Entities::Flush.new(cards: flush_1) }
      let(:hand_2) { PokerHands::Entities::Flush.new(cards: flush_2) }

      it 'returns hand 1 as the winner' do
        expect(hand_1 <=> hand_2).to be 1
      end
    end

    context 'hand 2 wins with the better flush' do
      let(:flush_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(8, 'H'),
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:flush_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(12, 'C'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:hand_1) { PokerHands::Entities::Flush.new(cards: flush_1) }
      let(:hand_2) { PokerHands::Entities::Flush.new(cards: flush_2) }

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end

      let(:flush_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(11, 'H'),
          PokerHands::Card.new(8, 'H'),
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:flush_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(11, 'C'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(10, 'C')
        ]
      end
      let(:hand_1) { PokerHands::Entities::Flush.new(cards: flush_1) }
      let(:hand_2) { PokerHands::Entities::Flush.new(cards: flush_2) }

      it 'returns hand 2 as the winner' do
        expect(hand_1 <=> hand_2).to be -1
      end
    end

    context 'the hands are a tie' do
      let(:flush_1) do
        [
          PokerHands::Card.new(4, 'H'),
          PokerHands::Card.new(12, 'H'),
          PokerHands::Card.new(8, 'H'),
          PokerHands::Card.new(2, 'H'),
          PokerHands::Card.new(9, 'H')
        ]
      end
      let(:flush_2) do
        [
          PokerHands::Card.new(4, 'C'),
          PokerHands::Card.new(12, 'C'),
          PokerHands::Card.new(8, 'C'),
          PokerHands::Card.new(2, 'C'),
          PokerHands::Card.new(9, 'C')
        ]
      end
      let(:hand_1) { PokerHands::Entities::Flush.new(cards: flush_1) }
      let(:hand_2) { PokerHands::Entities::Flush.new(cards: flush_2) }

      it 'returns a tie' do
        expect(hand_1 <=> hand_2).to eq('tie')
      end
    end
  end
end
