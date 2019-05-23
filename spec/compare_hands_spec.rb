require 'poker_hands/compare_hands'
require 'spec_helper'

RSpec.describe PokerHands::CompareHands do
  subject { PokerHands::CompareHands.new.call(hand1, hand2) }

  context 'hand 1 beats hand 2 with a set' do
    let(:hand1) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(4, 'S'),
        PokerHands::Card.new(8, 'S'),
        PokerHands::Card.new(4, 'D'),
        PokerHands::Card.new(9, 'S')
      ]
    end
    let(:hand2) do
      [
        PokerHands::Card.new(2, 'H'),
        PokerHands::Card.new(4, 'S'),
        PokerHands::Card.new(8, 'S'),
        PokerHands::Card.new(4, 'D'),
        PokerHands::Card.new(9, 'S')
      ]
    end
    it 'returns the correct winning statement' do
      expect(subject).to eq('Hand 1 is a three of a kind. Hand 2 is a pair. Hand 1 wins.')
    end
  end

  context 'hand 2 beats hand 1 with quads' do
    let(:hand1) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(2, 'S'),
        PokerHands::Card.new(4, 'C'),
        PokerHands::Card.new(2, 'D'),
        PokerHands::Card.new(9, 'S')
      ]
    end
    let(:hand2) do
      [
        PokerHands::Card.new(4, 'H'),
        PokerHands::Card.new(4, 'C'),
        PokerHands::Card.new(4, 'S'),
        PokerHands::Card.new(4, 'D'),
        PokerHands::Card.new(9, 'S')
      ]
    end
    it 'returns the correct winning statement' do
      expect(subject).to eq('Hand 1 is a two pair. Hand 2 is a four of a kind. Hand 2 wins.')
    end
  end

  context 'both hands are straights but hand 1 has better high card' do
    let(:hand1) do
      [
        PokerHands::Card.new(5, 'H'),
        PokerHands::Card.new(7, 'S'),
        PokerHands::Card.new(6, 'C'),
        PokerHands::Card.new(9, 'D'),
        PokerHands::Card.new(8, 'S')
      ]
    end
    let(:hand2) do
      [
        PokerHands::Card.new(2, 'H'),
        PokerHands::Card.new(3, 'C'),
        PokerHands::Card.new(4, 'S'),
        PokerHands::Card.new(5, 'D'),
        PokerHands::Card.new(6, 'S')
      ]
    end
    it 'returns the correct winning statement' do
      expect(subject).to eq('Hand 1 is a straight. Hand 2 is a straight. Hand 1 wins.')
    end
  end

  context 'both hands are straights but hand 2 has better high card' do
    let(:hand1) do
      [
        PokerHands::Card.new(2, 'H'),
        PokerHands::Card.new(3, 'C'),
        PokerHands::Card.new(4, 'S'),
        PokerHands::Card.new(5, 'D'),
        PokerHands::Card.new(6, 'S')
      ]
    end
    let(:hand2) do
      [
        PokerHands::Card.new(5, 'H'),
        PokerHands::Card.new(7, 'S'),
        PokerHands::Card.new(6, 'C'),
        PokerHands::Card.new(9, 'D'),
        PokerHands::Card.new(8, 'S')
      ]
    end
    it 'returns the correct winning statement' do
      expect(subject).to eq('Hand 1 is a straight. Hand 2 is a straight. Hand 2 wins.')
    end
  end

  context 'both hands are straights with same high card' do
    let(:hand1) do
      [
        PokerHands::Card.new(5, 'H'),
        PokerHands::Card.new(7, 'S'),
        PokerHands::Card.new(6, 'C'),
        PokerHands::Card.new(9, 'D'),
        PokerHands::Card.new(8, 'S')
      ]
    end
    let(:hand2) do
      [
        PokerHands::Card.new(5, 'H'),
        PokerHands::Card.new(7, 'S'),
        PokerHands::Card.new(6, 'C'),
        PokerHands::Card.new(9, 'D'),
        PokerHands::Card.new(8, 'S')
      ]
    end
    it 'returns the correct winning statement' do
      expect(subject).to eq('Hand 1 is a straight. Hand 2 is a straight. Tie.')
    end
  end
end
