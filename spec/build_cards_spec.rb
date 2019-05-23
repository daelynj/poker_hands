require 'poker_hands/build_cards'
require 'spec_helper'


RSpec.describe PokerHands::BuildCards do
  subject { PokerHands::BuildCards.new.call() }

  context 'builds cards' do
    it 'produces Card objects' do
      expect(subject).to all(be_a(PokerHands::Card))
    end
  end
end
