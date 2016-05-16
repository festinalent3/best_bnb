require 'spec_helper'

def sign_up
  visit '/users/new'
  fill_in :name, with: 'Max Beast'
  fill_in :email, with: 'max@beast.com'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banana!'
  click_button 'Sign up'
end

feature 'User signs up' do
  scenario 'User can sign up' do 
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Max Beast!')
    expect(User.first.email).to eq('max@beast.com')
  end 
end