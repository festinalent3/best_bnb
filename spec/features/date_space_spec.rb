feature 'when space is created' do
  scenario 'user can specify the dates' do
    add_space
    expect{add_space}.to change(Space, :count).by(1)
    expect(Space.last.available_dates.range.first).to eq(Date.new(2015,12,31))
    expect(Space.last.available_dates.range.last).to eq(Date.new(2016,1,15))
    expect(current_path).to eq '/spaces/all'
    within('ul#spaces') do
      expect(page).to have_content 'Available from: 2015-12-31, to: 2016-01-15'
    end
  end
end
