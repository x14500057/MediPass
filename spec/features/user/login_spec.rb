require "rails_helper"

RSpec.feature "Sign up", :type => :feature do
  let(:user) { build(:user) }

  scenario 'user navigates to sign up page and successfully signs up', js: true do
    visit root_path
    find('.sign-up-btn').click
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    find('#user_role').find('option[value="patient"]').select_option
    find('.sign-up-button').click
    expect(page).to have_selector('h1', text: 'Almost There')
    
  end

end