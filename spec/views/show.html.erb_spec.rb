require 'rails_helper'

RSpec.describe 'Category page', type: :feature do
  before do
    User.create(name: 'spec_user')
    visit 'http://localhost:3000/'
    fill_in 'user[name]', with: 'spec_user'
    click_button 'commit'
  end

  scenario 'Category page' do
    visit 'http://localhost:3000/articles'
    expect(page).to have_content('TRAIN')
  end
end
