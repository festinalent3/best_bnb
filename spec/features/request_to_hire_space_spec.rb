feature 'User requests to hire a space' do 
  scenario 'user chooses the dates to hire' do 
    add_space
    click_button 'Sign out'
    sign_up_renter
    visit '/spaces/all'
    click_button 'Rent this space'
    expect(current_path).to eq '/spaces/request'
    expect(page).to have_content('Penthouse')
  end
end