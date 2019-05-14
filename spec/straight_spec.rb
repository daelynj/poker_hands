RSpec.describe Straight do
  describe '#check' do
    subject { Straight.new.check(hand) }

    context 'when hand is a Straight' do
      let(:hand) do
        [
          Card.new('9', 'C'),
          Card.new('8', 'D'),
          Card.new('7', 'S'),
          Card.new('6', 'D'),
          Card.new('5', 'H')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a Straight' do
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
