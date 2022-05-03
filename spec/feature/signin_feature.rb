require 'rails_helper'

feature 'User sign in' do
  given!(:user) { FactoryBot.create(:user) }

  scenario 'User must sign in' do
    visit 'users/sign_in'
    fill_in "Email",	with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content "Welcome to Rails Test Casees App."
  end
end
