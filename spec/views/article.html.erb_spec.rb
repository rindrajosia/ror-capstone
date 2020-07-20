require 'rails_helper'

RSpec.describe 'New article page', type: :feature do
  before do
    User.create(name: 'spec_user')
    visit 'http://localhost:3000/'
    fill_in 'user[name]', with: 'spec_user'
    click_button 'commit'
  end

  scenario 'visit New article page' do
    visit 'http://localhost:3000/articles/new'
    expect(page).to have_content('Write an article')
  end
end
