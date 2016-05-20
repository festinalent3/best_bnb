describe DateRange do
  let(:from_date) { '2016-2-13' }
  let(:to_date) { '2016-3-1' }
  let(:book_from) { '2016-2-15'}
  let(:book_to) { '2016-2-18' }
  let(:user_id) { :'5' }

  let(:range) { [*Date.parse(from_date)..Date.parse(to_date)] }
  let(:booked_range){ [:booked, :booked, :booked] }
  let(:requested_range){ {user_id => {:check_in_date => book_from, :check_out_date => book_to}} }

  describe '#generate_range' do
    it 'creates a range' do
      expect(DateRange.generate_range(from_date, to_date)).to eq(range)
    end
  end

  it 'marks dates as booked' do
    expect(DateRange.book_dates(book_from, book_to, range)).to eq([*Date.parse(from_date)...Date.parse(book_from)] + booked_range + [*Date.parse(book_to)..Date.parse(to_date)])
  end

  it 'marks dates as requested' do
    expect(DateRange.request_dates(book_from, book_to, user_id)).to eq(requested_range)
  end

end
