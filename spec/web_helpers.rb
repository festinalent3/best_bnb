def sign_up
  visit '/users/new'
  fill_in :name, with: 'Max Beast'
  fill_in :email, with: 'max@beast.com'
  fill_in :password, with: 'banana!'
  fill_in :password_confirmation, with: 'banana!'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def add_space
  sign_up
  sign_in(email: 'max@beast.com', password: 'banana!')
  click_button 'List space'
  fill_in 'title', with: 'Penthouse'
  fill_in 'description', with: 'Glorious city views'
  fill_in 'from_date', with: '2015-12-31'
  fill_in 'to_date', with: '2016-1-1'
  click_button 'Add space'
end

def add_another_space
  sign_up
  sign_in(email: 'max@beast.com', password: 'banana!')
  click_button 'List space'
  fill_in 'title', with: "Max's Beach House"
  fill_in 'description', with: "Fun getaway for the weekend"
  fill_in 'from_date', with: '2015-12-31'
  fill_in 'to_date', with: '2016-1-1'
  click_button 'Add space'
end

def add_space_with_dates
  sign_up
  sign_in(email: 'max@beast.com', password: 'banana!')
  click_button 'List space'
  fill_in 'title', with: 'Penthouse'
  fill_in 'description', with: 'Glorious city views'
  fill_in 'from_date', with: '2015-12-31'
  fill_in 'to_date', with: '2016-1-1'
  click_button 'Add space'
end