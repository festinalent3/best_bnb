describe Space do
  let!(:space) { described_class.new }

  let(:from_date) { '2016-2-13' }
  let(:to_date) { '2016-3-1' }
  let(:book_from) { '2016-2-15'}
  let(:book_to) { '2016-2-18' }
  let(:user_id) { :'7' }
  let(:req_dates) { {user_id => {:check_in_date => book_from, :check_out_date => book_to}} }
  let(:requested_range){ [req_dates, {user_id => {:check_in_date => from_date, :check_out_date => to_date}}] }
  let(:updated_range){ [{user_id => {:check_in_date => from_date, :check_out_date => to_date}}] }

  it 'can store multiple requests to book the space' do
    space.attribute_set(:requested_dates, [req_dates])
    Space.store_multiple_requests(space, from_date, to_date, user_id)
    expect(space.requested_dates).to eq(requested_range)
  end

  it 'can store multiple requests to book the space' do
    space.attribute_set(:requested_dates, [req_dates])
    Space.store_multiple_requests(space, from_date, to_date, user_id)
    Space.update_requested_dates(space, book_from)
    expect(space.requested_dates).to eq(updated_range)
  end
end
