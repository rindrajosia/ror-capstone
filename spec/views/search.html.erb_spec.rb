require 'rails_helper'

RSpec.describe 'Search page', type: :feature do
  before do
    User.create(name: 'spec_user')
    visit 'http://localhost:3000/'
    fill_in 'user[name]', with: 'spec_user'
    click_button 'commit'
  end

  scenario 'visit search page' do
    visit 'http://localhost:3000/articles/search'
    expect(page).to have_content('Title')
  end
end
