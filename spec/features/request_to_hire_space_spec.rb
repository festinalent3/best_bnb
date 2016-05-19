feature 'User requests to hire a space' do
  scenario 'user chooses the space to rent' do
    click_rent_button
    expect(current_path).to eq '/spaces/request'
    expect(page).to have_content('Penthouse')
  end
  scenario 'user chooses the dates to hire' do
    click_rent_button
    fill_in :check_in_date, with: '2015-12-31'
    fill_in :check_out_date, with: '2016-01-05'
    click_button 'Request to rent!'
    expect(page).to have_content('Your request was sent')
  end
end
