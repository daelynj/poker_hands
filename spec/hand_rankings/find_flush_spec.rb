require_relative '../../lib/poker_hands/hand_rankings/find_flush'
require_relative '../../lib/poker_hands/card'
require 'pry'

RSpec.describe PokerHands::FindFlush do
  describe '#call' do
    subject { PokerHands::FindFlush.new.call(hand) }

    context 'when hand is a Flush' do
      let(:hand) do
        [
          PokerHands::Card.new('4', 'S'),
          PokerHands::Card.new('11', 'S'),
          PokerHands::Card.new('8', 'S'),
          PokerHands::Card.new('2', 'S'),
          PokerHands::Card.new('9', 'S')
        ]
      end

      it { is_expected.to be_an_instance_of(PokerHands::Entities::Flush) }

      #it 'returns the expected cards in the flush' do
      #  binding.pry
        #expect(subject.flush).to 
      #end
    end
  end
end
