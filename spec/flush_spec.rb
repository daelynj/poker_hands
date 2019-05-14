RSpec.describe Flush do
  describe '#check' do
    subject { Flush.new.check(hand) }

    context 'when hand is a Flush' do
      let(:hand) do
        [
          Card.new('4', 'S'),
          Card.new('11', 'S'),
          Card.new('8', 'S'),
          Card.new('2', 'S'),
          Card.new('9', 'S')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is a StraightFlush' do
      let(:hand) do
        [
          Card.new('8', 'C'),
          Card.new('7', 'C'),
          Card.new('6', 'C'),
          Card.new('5', 'C'),
          Card.new('4', 'C')
        ]
      end

      it { is_expected.to be true }
    end    

    context 'when hand is not a Flush' do
      let(:hand) do
        [
          Card.new('7', 'C'),
          Card.new('7', 'D'),
          Card.new('7', 'S'),
          Card.new('13', 'C'),
          Card.new('3', 'D')
        ]
      end

      it { is_expected.to be false }
    end
  end
end
