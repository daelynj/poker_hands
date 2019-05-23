require 'poker_hands/declare_winner'
require 'spec_helper'

RSpec.describe PokerHands::DeclareWinner do
  subject { PokerHands::DeclareWinner.new.call(hand1, hand2, winner) }

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
    let(:winner) { 'Hand 1 is a three of a kind. Hand 2 is a pair. Hand 1 wins.' }

    it 'outputs to stdout the correct winning statement' do
      expect { subject }.to output(
        "Hand 1: [4H, 4S, 8S, 4D, 9S]\n"\
        "Hand 2: [2H, 4S, 8S, 4D, 9S]\n\n"\
        "Hand 1 is a three of a kind. Hand 2 is a pair. Hand 1 wins.\n"
      ).to_stdout
    end
  end
end
