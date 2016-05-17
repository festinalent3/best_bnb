describe DateRange do
let(:from_date) { '2016-2-13' }
let(:to_date) { '2016-3-1' }
let(:book_from) { '2016-2-15'}
let(:book_to) { '2016-2-18' }
let(:daterange) { described_class.new(from_date, to_date) }
let(:range) { [*Date.parse(from_date)..Date.parse(to_date)] }
let(:booked_range){ [:booked, :booked, :booked] }


    describe '#generate_range' do
      it 'creates a range' do
        expect(daterange.generate_range(from_date, to_date)).to eq(range)
      end
    end

    it 'contains a range on intialization' do
      expect(daterange.range).to eq(range)
    end

    it 'marks dates as booked within date_range' do
      daterange.book_dates(book_from, book_to)
      expect(daterange.range).to eq([*Date.parse(from_date)...Date.parse(book_from)] + booked_range + [*Date.parse(book_to)..Date.parse(to_date)])
    end

end
