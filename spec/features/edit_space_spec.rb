feature 'Edit Spaces' do

  scenario 'user cannot rent their own space but can edit it' do
    add_space
    expect(current_path).to eq '/spaces/all'
    expect(page).not_to have_button 'Rent this space'
    expect(page).to have_button 'Edit your space'
    click_button 'Edit your space'
    expect(page.status_code).to eq(200)
  end

  scenario 'user can edit their space details' do
    add_space
    click_button 'Edit your space'
    expect(page).to have_selector("input[value='Penthouse']")
    expect(page).to have_selector("input[value='99']")
    expect(page).to have_field('description', visible: 'Glorious city views')
    expect(page).not_to have_button 'Add space'
    expect(page).to have_button 'Cancel'
    expect(page).to have_button 'Submit changes'
  end

  scenario 'user can submit their changes' do 
    add_space
    click_button 'Edit your space'
    fill_in 'price', with: '22222.00'
    expect{(click_button 'Submit changes')}.not_to change(Space, :count)
  end

  scenario 'updated space details are displayed' do 
    add_space
    click_button 'Edit your space'
    fill_in 'price', with: '22222.00'
    fill_in 'from_date', with: '2015-12-31'
    fill_in 'to_date', with: '2016-01-31'
    click_button 'Submit changes'
    expect(page).not_to have_content("$99 a night")
    expect(page).to have_content("$22222 a night")
    expect(page).to have_content('Available from: 2015-12-31, to: 2016-01-31')
  end

end