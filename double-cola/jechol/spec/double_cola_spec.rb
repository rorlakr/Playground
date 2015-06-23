require 'double_cola'

describe DoubleCola do
  describe '.whoIsNext' do
    let(:people) { ['철수', '민호', '수지', '효성', '지수'] }
    shared_examples 'expectation' do |nth, person|
      specify do
        expect(described_class.whoIsNext(people, nth)).to eq person
      end
    end

    it_behaves_like 'expectation', 1, '철수'
    it_behaves_like 'expectation', 52, '수지'
    it_behaves_like 'expectation', 7230702951, '민호'
  end
end
