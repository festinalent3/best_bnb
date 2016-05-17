feature 'User signs up' do
  scenario 'User can sign up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page.status_code).to eq 200
    expect(page).to have_content('Welcome, Max Beast!')
    expect(User.first.email).to eq('max@beast.com')
  end
end
