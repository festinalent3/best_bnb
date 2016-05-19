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


end