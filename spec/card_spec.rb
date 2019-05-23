require 'poker_hands/card'
require 'spec_helper'

RSpec.describe PokerHands::Card do
  subject { PokerHands::Card.new(5, 'C') }
  it 'returns expected rank' do
    expect(subject.rank).to be(5)
  end

  it 'returns expected suit' do
    expect(subject.suit).to eq('C')
  end

  describe '#to_s' do
    it 'combines rank and suit' do
      expect(subject.to_s).to eq('5C')
    end
  end
end
