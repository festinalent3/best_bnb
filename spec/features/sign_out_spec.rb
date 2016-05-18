feature 'User signs out' do
  scenario 'while being signed in' do
    sign_up
    click_button 'Sign out'
    expect(page.status_code).to eq 200
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end
end
