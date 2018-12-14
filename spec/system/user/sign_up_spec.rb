require 'rails_helper'

RSpec.feature 'Sign up', type: :system do
  let(:user) { build(:user) }

  scenario 'ユーザがsignupページを開いてサインアップに成功する' do
    visit root_path
    find('nav a', text: 'Signup').click
    fill_in 'user[name]', with: user.name
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    fill_in 'user[password_confirmation]', with: user.password_confirmation
    find('.sign-up-button').click
    expect(page).to have_selector('#user-settings')
  end
end
