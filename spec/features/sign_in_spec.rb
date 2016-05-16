feature 'user signin' do
	
  scenario 'with correct credentials' do
  	sign_up
    sign_in(email: 'max@beast.com', password: 'banana!')
    expect(page).to have_content "Welcome, Max Beast!"
  end
end