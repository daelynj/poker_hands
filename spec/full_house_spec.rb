RSpec.describe FullHouse do
  describe '#check' do
    subject { FullHouse.new.check(hand) }

    context 'when hand is a FullHouse' do
      let(:hand) do
        [
          Card.new('10', 'H'),
          Card.new('10', 'D'),
          Card.new('10', 'S'),
          Card.new('9', 'C'),
          Card.new('9', 'D')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a FullHouse' do
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
