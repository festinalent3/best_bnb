describe DateRange do
let(:from_date) { Date.new(2016,2,13) }
let(:to_date) { Date.new(2016,3,1) }
let(:daterange) { described_class.new }
let(:range) { [*from_date..to_date] }

    it 'creates a range' do
      expect(daterange.generate_range(from_date, to_date)).to eq(range)
    end
end
