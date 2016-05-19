feature 'approve space request' do
  scenario 'user can see the dates on a single request request' do
    add_space
    click_button 'Sign out'
    sign_up_renter
    visit '/spaces/all'
    click_button 'Rent this space'
    fill_in :check_in_date, with: '2015-12-31'
    fill_in :check_out_date, with: '2016-01-05'
    click_button 'Request to rent!'
    click_button 'Sign out'
    sign_in(email: 'max@beast.com', password: 'banana!')
    visit '/spaces/confirmations/pending'
    expect(page).to have_content('Namitha')
    expect(page).to have_content('2015-12-31')
    expect(page).to have_content('2016-01-05')
  end

  scenario 'user can see the dates on multiple requests' do
    add_space
    click_button 'Sign out'
    sign_up_renter
    visit '/spaces/all'
    click_button 'Rent this space'
    fill_in :check_in_date, with: '2015-12-31'
    fill_in :check_out_date, with: '2016-01-05'
    click_button 'Request to rent!'

    visit '/spaces/all'
    click_button 'Rent this space'
    fill_in :check_in_date, with: '2016-01-01'
    fill_in :check_out_date, with: '2016-01-06'
    click_button 'Request to rent!'

    click_button 'Sign out'
    sign_in(email: 'max@beast.com', password: 'banana!')
    visit '/spaces/confirmations/pending'
    expect(page).to have_content('Namitha')
    expect(page).to have_content('2015-12-31')
    expect(page).to have_content('2016-01-05')

    expect(page).to have_content('2015-01-01')
    expect(page).to have_content('2016-01-06')
  end
end
