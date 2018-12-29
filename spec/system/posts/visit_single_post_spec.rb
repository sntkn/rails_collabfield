require 'rails_helper'

RSpec.feature 'Visit single post', type: :system do
  let(:user) { create(:user) }
  let(:post) do
    category = create(:category, branch: 'hobby')
    create(:post, category_id: category.id)
  end

  scenario 'User goes to a single post from the home page', js: true do
    post
    visit root_path
    page.find('.single-post-card').click
    expect(page).to have_selector('body .modal')
    page.find('.interested a').click
    expect(page).to have_selector('#single-post-content p', text: post.content)
  end
end
