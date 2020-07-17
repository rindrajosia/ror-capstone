require 'rails_helper'

RSpec.feature 'Sign', type: :feature do
  describe '#log_in' do
    let(:user) { User.create(name: 'test') }
    scenario 'There should be a valid user name to sign in' do
      visit 'http://localhost:3000/sessions/login'

      within find('#new_user') do
        click_button 'commit'
      end
      expect(current_path).to eq('/sessions/login')
    end
  end

  describe '#log_in' do
    let(:user) { User.create(name: 'test') }
    scenario 'If a user is signed in succesfully, the user must be redirected to the Article Index page' do
      visit 'http://localhost:3000/sessions/login'

      within find('#new_user') do
        user = User.create(name: 'test')
        fill_in 'user[name]', with: user.name
        click_button 'commit'
      end
      expect(current_path).to eq('/articles')
    end
  end
end
