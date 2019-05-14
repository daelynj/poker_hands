RSpec.describe Pair do
  describe '#check' do
    subject { Pair.new.check(hand) }

    context 'when hand is a Pair' do
      let(:hand) do
        [
          Card.new('14', 'H'),
          Card.new('14', 'D'),
          Card.new('8', 'C'),
          Card.new('4', 'S'),
          Card.new('7', 'H')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is a TwoPair' do
      let(:hand) do
        [
          Card.new('4', 'C'),
          Card.new('4', 'S'),
          Card.new('3', 'C'),
          Card.new('3', 'D'),
          Card.new('12', 'C')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a Pair' do
      let(:hand) do
        [
          Card.new('4', 'S'), 
          Card.new('11', 'S'),
          Card.new('8', 'S'),
          Card.new('2', 'S'),
          Card.new('9', 'S')
        ]
      end

      it { is_expected.to be false }
    end
  end
end
