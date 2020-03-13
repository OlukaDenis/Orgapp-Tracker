require 'rails_helper'

RSpec.feature 'User login', type: :feature do
  before(:all) { @user = create(:user) }
  scenario 'with correct user details' do
    visit signin_path
    fill_in 'login', with: @user.name
    click_button 'Signin'
    expect(page).to have_content('mcdenny')
  end

  scenario 'with incorrect user details' do
    visit signin_path
    fill_in 'login', with: 'wrong info'
    click_button 'Signin'
    expect(page).to have_content('Sign In')
  end
end
