require 'rails_helper'

RSpec.feature 'User signup', type: :feature do
  scenario 'with correct user details' do
    visit signup_path
    user = build(:user)
    fill_in 'name', with: user.name
    click_button 'Signup'
    expect(page).to have_content('mcdenny')
  end

  scenario 'with empty user details' do
    visit signup_path
    fill_in 'name', with: ''
    click_button 'Signup'
    expect(page).to have_content('Name can\'t be blank')
  end
end
