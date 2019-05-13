RSpec.describe FourOfAKind do
  describe '.check' do
    subject { FourOfAKind.new.check(hand) }

    context 'when hand is a FourOfAKind' do
      let(:hand) do
        [
          Card.new('11', 'H'),
          Card.new('11', 'D'),
          Card.new('11', 'S'),
          Card.new('11', 'C'),
          Card.new('7', 'D')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a FourOfAKind' do
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
