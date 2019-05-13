RSpec.describe RoyalFlush do
  describe '.check' do
    subject { RoyalFlush.new.check(hand) }

    context 'when hand is a RoyalFlush' do
      let(:hand) do
        [
          Card.new('14', 'D'),
          Card.new('13', 'D'),
          Card.new('12', 'D'),
          Card.new('11', 'D'),
          Card.new('10', 'D')
        ]
      end

      it { is_expected.to be true }
    end

    context 'when hand is not a RoyalFlush' do
      let(:hand) do
        [Card.new('4', 'S'), 
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
