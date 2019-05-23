require 'poker_hands/deck'
require 'spec_helper'


RSpec.describe PokerHands::Deck do
  subject { PokerHands::Deck.new() }

  context 'a Deck' do
    it 'contains 52 Card objects' do
      expect(subject.cards.length).to be(52)
      expect(subject.cards).to all(be_a(PokerHands::Card))
    end
  end

  describe '#draw' do
    context 'drawing two cards' do
      let(:hand1) { subject.draw(2) }

      it 'draws the ace of diamonds off the deck' do
        expect(hand1[1].rank).to be(14)
        expect(hand1[1].suit).to eq('D')
      end

      it 'draws the ace of spades off the deck' do
        expect(hand1[0].rank).to be(14)
        expect(hand1[0].suit).to eq('S')
      end
    end
  end
end
