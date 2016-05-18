feature 'User adds spaces' do
  scenario 'user visits new space page' do
    sign_up
    sign_in(email: 'max@beast.com', password: 'banana!')
    click_button 'List space'
    expect(current_path).to eq '/spaces/new'
  end

  scenario 'user can add multiple spaces with titles, prices and descriptions' do
    add_space
    add_another_space
    expect(page).to have_content('Penthouse')
    expect(page).to have_content("Max's Beach House")
    expect(page).to have_content("$99 a night")
    expect(page).to have_content("Fun getaway for the weekend")
    expect(page).to have_content("Glorious city views")
    expect(page).to have_content("$110 a night")
  end

  scenario 'user adds details of the new space when signed in' do
    expect{add_space}.to change(Space, :count).by(1)
    expect(page).to have_content('Space added')
  end

  scenario 'user cannot add space if not signed in' do
    visit '/spaces/all'
    expect(page).not_to have_button('List space')
  end


end
