feature 'User requests to hire a space' do
  scenario 'user chooses the space to rent' do
    add_space
    click_button 'Sign out'
    sign_up_renter
    visit '/spaces/all'
    click_button 'Rent this space'

    expect(current_path).to eq '/spaces/request'
    expect(page).to have_content('Penthouse')
  end
  scenario 'user chooses the dates to hire' do
    add_space
    click_button 'Sign out'
    sign_up_renter
    visit '/spaces/all'
    click_button 'Rent this space'

    fill_in :check_in_date, with: '2015-12-31'
    fill_in :check_out_date, with: '2016-01-05'

    click_button 'Request to rent!'
    expect(page).to have_content('Your request was sent')
  end
end
