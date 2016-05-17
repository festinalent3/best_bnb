feature 'User signs in' do
  scenario 'with correct credentials' do
  	sign_up
    sign_in(email: 'max@beast.com', password: 'banana!')
		expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome, Max Beast!"
  end

	scenario 'with incorrect credentials' do
    sign_in(email: 'just@wrong.com', password: 'orange!')
		expect(page.status_code).to eq 200
    expect(page).to have_content "The email or password is incorrect"
  end
end
